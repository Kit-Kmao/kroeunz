<?php
include_once 'connection.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Fetch all classes for the dropdown
$sql = "SELECT * FROM tb_class";
$stmt = $conn->prepare($sql);
$stmt->execute();
$classes = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch subjects
$sql = "SELECT * FROM tb_sub_type ORDER BY id ASC";
$stmt = $conn->prepare($sql);
$stmt->execute();
$subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Initialize variables for selected month and class
$selected_month = '';
$selected_class = '';
$students_info = [];

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $selected_month = $_POST['month'] ?? '';
    $selected_class = $_POST['Class_id'] ?? '';

    // Only run the query if a class is selected
    if ($selected_class) {
        // Fetch students based on selected class
        $sql = "SELECT tb_student.ID, tb_student.En_name, tb_student.Gender
                FROM tb_add_to_class
                INNER JOIN tb_student ON tb_add_to_class.Stu_id = tb_student.ID
                INNER JOIN tb_class ON tb_add_to_class.Class_id = tb_class.ClassID
                WHERE tb_class.ClassID = :class_id";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':class_id', $selected_class, PDO::PARAM_INT);
        $stmt->execute();
        $students_info = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Handle score submission
    if (isset($_POST['scorebox'])) {
        foreach ($_POST['scorebox'] as $student_id => $scores) {
            // Extracting scores for each subject
            $homework = $scores['Homework'] ?? 0;
            $participation = $scores['Participation'] ?? 0;
            $attendance = $scores['Attendance'] ?? 0;
            $monthly = $scores['Monthly'] ?? 0;

            // Calculate average score
            $average = ($homework + $participation + $attendance + $monthly) / 4;

            // Insert into the scores table
            $sql = "INSERT INTO tb_month_score (Class_id, Homework, Participation, Attendance, Monthly, Average, Stu_id, for_month)
                    VALUES (:class_id, :homework, :participation, :attendance, :monthly, :average, :student_id, :for_month)";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(":class_id", $selected_class, PDO::PARAM_INT);
            $stmt->bindParam(":homework", $homework, PDO::PARAM_INT);
            $stmt->bindParam(":participation", $participation, PDO::PARAM_INT);
            $stmt->bindParam(":attendance", $attendance, PDO::PARAM_INT);
            $stmt->bindParam(":monthly", $monthly, PDO::PARAM_INT);
            $stmt->bindParam(":average", $average, PDO::PARAM_STR);
            $stmt->bindParam(":student_id", $student_id, PDO::PARAM_INT);
            $stmt->bindParam(":for_month", $selected_month, PDO::PARAM_STR);
            $stmt->execute();
        }
        echo "<script>alert('Scores saved successfully!'); window.location.href='score.php';</script>";
    }
}
?>

<?php include_once 'header.php'; ?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>List Students</h1>
                </div>
            </div>
        </div>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                          <form action="" method="POST">
                              <div class="row mb-2">
                                  <div class="col-sm-5">
                                      <label for="month">For Month</label>
                                      <select name="month" id="month" class="form-control">
                                          <option value="">--Select Month--</option>
                                          <option value="First Month" <?php echo ($selected_month == 'First Month') ? 'selected' : ''; ?>>First Month</option>
                                          <option value="Second Month" <?php echo ($selected_month == 'Second Month') ? 'selected' : ''; ?>>Second Month</option>
                                          <option value="Third Month" <?php echo ($selected_month == 'Third Month') ? 'selected' : ''; ?>>Third Month</option>
                                          <option value="Fourth Month" <?php echo ($selected_month == 'Fourth Month') ? 'selected' : ''; ?>>Fourth Month</option>
                                          <option value="Fifth Month" <?php echo ($selected_month == 'Fifth Month') ? 'selected' : ''; ?>>Fifth Month</option>
                                          <option value="Sixth Month" <?php echo ($selected_month == 'Sixth Month') ? 'selected' : ''; ?>>Sixth Month</option>
                                          <option value="Seventh Month" <?php echo ($selected_month == 'Seventh Month') ? 'selected' : ''; ?>>Seventh Month</option>
                                          <option value="Eighth Month" <?php echo ($selected_month == 'Eighth Month') ? 'selected' : ''; ?>>Eighth Month</option>
                                          <option value="Ninth Month" <?php echo ($selected_month == 'Ninth Month') ? 'selected' : ''; ?>>Ninth Month</option>
                                          <option value="Tenth Month" <?php echo ($selected_month == 'Tenth Month') ? 'selected' : ''; ?>>Tenth Month</option>
                                      </select>
                                  </div>
                                  <div class="col-sm-5">
                                      <label for="class">For Class</label>
                                      <select name="Class_id" id="Class_id" class="form-control">
                                          <option value="">--Select Class--</option>
                                          <?php foreach ($classes as $row) : ?>
                                              <option value="<?= $row['ClassID']; ?>" <?= ($row['ClassID'] == $selected_class) ? 'selected' : ''; ?>><?= $row['Class_name']; ?></option>
                                          <?php endforeach; ?>
                                      </select>
                                  </div>
                                  <div class="col-ms-2">
                                      <label for="">&nbsp;</label>
                                      <div class="ml-3">
                                          <input type="submit" value="Show" name="btnsave" class="btn btn-success">
                                      </div>
                                  </div>
                              </div>
                          </form>
                        </div>

                        <!-- Show the table only if a class is selected -->
                        <?php if (!empty($students_info)) : ?>
                            <form action="" method="POST" name="formscore">
                                <div class="card-body p-0">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Student Name</th>
                                                <th>Gender</th>
                                                <?php foreach ($subjects as $subject): ?>
                                                    <th class="text-center"><?php echo $subject['name']; ?></th>
                                                <?php endforeach; ?>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <?php foreach ($students_info as $key => $student): ?>
                                                <tr>
                                                    <td><?php echo $key + 1; ?></td>
                                                    <td><?php echo $student['En_name']; ?></td>
                                                    <td><?php echo $student['Gender']; ?></td>

                                                    <?php foreach ($subjects as $subject): ?>
                                                        <td style="padding:0px">
                                                            <input type="number" class="form-control text-center"
                                                                   name="scorebox[<?php echo $student['ID']; ?>][<?php echo $subject['name']; ?>]"
                                                                   placeholder="0-100" min="0" max="100">
                                                        </td>
                                                    <?php endforeach; ?>
                                                </tr>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="card-footer">
                                    <button class="btn btn-primary" type="submit" name="btnsubmit">Save Scores</button>
                                </div>
                            </form>
                        <?php else: ?>
                            <div class="card-body">
                                <p class="text-center">No students found for the selected class and month.</p>
                            </div>
                        <?php endif; ?>
                        <!-- no students found for the selected -->
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<?php include_once 'footer.php'; ?>
