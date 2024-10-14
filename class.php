<?php
include 'connection.php';
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}


$sql = "SELECT * FROM tb_add_to_class atc JOIN tb_class c ON c.ClassID = atc.Class_id JOIN tb_student stu ON stu.ID = atc.Stu_id WHERE atc.id";
$stmt = $conn->prepare($sql);
$stmt->execute();
$class = $stmt->fetchAll(PDO::FETCH_ASSOC);




//pages
$sql  = "SELECT COUNT(*) AS CountRecords FROM tb_add_to_class";
$stmt = $conn->prepare($sql);
$stmt->execute();
$temp = $stmt->fetch(PDO::FETCH_ASSOC);

$maxpage = 1;
if ($temp) {
    $maxpage = ceil($temp['CountRecords'] / 10);
}
?>

<?php include_once 'header.php'; ?>

<section class="content-wrapper">
    <div class="container-fluid">
        <div class="row mb-2 card-header">
            <div class="col-sm-6">
                <h3 class="m-0" style="font-family:Khmer OS Siemreap; color:#152550;">
                    |Class
                </h3>
            </div>
            <div class="col-sm-6">
                <h3 class="card-title float-sm-right">
                    
                </h3>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <div class="row m-2">
        <div class="col-12">
            <div class="card">
                <form name="classform" method="post" action="">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <div class="input-group">
                                    <label for="inputName">Student Name:</label>
                                    <select name="" id="" class="form-control">
                                        <option value="">Select Student</option>
                                        <?php foreach ($data as $key => $value) { ?>
                                        <option value="<?php echo $value['ID']; ?>">
                                            <?php echo $value['En_name']; ?>
                                        </option>
                                        <?php } ?>
                                    </select>

                                    <div class="ml-3">
                                        <input type="submit" value="Submit" name="btnsave" class="btn btn-success">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group" style="width: 300px;">
                                <input type="text" id="" name="namesearch" class="search form-control float-right"
                                    placeholder="Search" style="font-family:Khmer OS Siemreap;">
                                <div class=" input-group-append">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>


                <!-- <div class="card-tools">
                        <div class="form-group" style="width: 300px;">
                            <input type="text" id="" name="namesearch" class="search form-control float-right"
                                placeholder="Search" style="font-family:Khmer OS Siemreap;">
                            <div class=" input-group-append">
                            </div>
                        </div>
                    </div> -->
            </div>

            <div class="card-body table-responsive p-0 text-sm">
                <table class="table table-hover text-nowrap" style="font-family:Khmer OS Siemreap;" id="userTbl">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Class Name</th>
                            <th>English Name</th>
                            <th>Khmer Name</th>
                            <th>Student Code</th>
                            <th>Gender</th>
                            <th>Date of Birth</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="showdata">
                        <?php if (isset($data)) { ?>
                        <?php foreach ($data as $key => $value) { ?>
                        <tr>
                            <td><?php
                                        if (isset($_GET['page']) && $_GET['page'] > 1)
                                            echo ($_GET['page'] - 1) * 10 + ($key + 1);
                                        else
                                            echo ($key + 1);
                                        ?></td>

                            <td><?php echo $value['Class_name']; ?></td>
                            <td><?php echo $value['En_name']; ?></td>
                            <td><?php echo $value['Kh_name']; ?></td>
                            <td><?php echo $value['Stu_code']; ?></td>
                            <td><?php echo $value['Gender']; ?></td>
                            <td><?php echo $value['DOB']; ?></td>
                            <td>
                                <a class="m-2" href="all_condition.php?remove_cid=<?php echo $value['id'] ?>"
                                    onclick="return confirm('Do you want to delete this record?')">
                                    <i class="fa fa-trash text-danger"></i>
                                </a>
                            </td>
                        </tr>
                        <?php } ?>
                        <?php } ?>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
    <!-- /.row -->
</section>


<?php include_once 'footer.php'; ?>