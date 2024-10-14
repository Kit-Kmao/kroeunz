<?php
include 'connection.php';
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}


// $sql = "SELECT * FROM tb_add_to_class atc JOIN tb_class c ON c.ClassID = atc.Class_id JOIN tb_student stu ON stu.ID = atc.Stu_id WHERE atc.id";
// $stmt = $conn->prepare($sql);
// $stmt->execute();
// $class = $stmt->fetchAll(PDO::FETCH_ASSOC);
// if (isset($_POST['btnsave'])) {
//     $id = $_POST['addtoclass'];
$sql = "SELECT * FROM tb_add_to_class";
$stmt = $conn->prepare($sql);
$stmt->execute();
$addtoclass = $stmt->fetch(PDO::FETCH_ASSOC);
// }

$sql = "SELECT * FROM tb_class ";
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
                    |Student List
                    <!-- <?php echo $_GET['cl_id'] ?> -->
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
                <div class="card-header">
                    <div class="card-tool">
                        <form name="classform" method="post" action="">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <select name="addclass" id="" class="form-control">
                                            <option value="">--Select Class--</option>
                                            <?php foreach ($class as $row) : ?>
                                            <option value="<?= $row['ClassID']; ?>"><?= $row['Class_name']; ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="ml-3">
                                        <input type="submit" value="Show" name="btnsave" class="btn btn-success">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group" style="width: 300px;">
                                        <input type="text" id="" name="namesearch"
                                            class="search form-control float-right" placeholder="Search"
                                            style="font-family:Khmer OS Siemreap;">
                                        <div class="input-group-append">
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                    </form>
                </div>
            </div>

            <div class="card-body table-responsive p-0 text-sm">
                <table class="table table-hover text-nowrap" style="font-family:Khmer OS Siemreap;" id="userTbl">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Class Name</th>
                            <th>English Name</th>
                            <!-- <th>Khmer Name</th>
                            <th>Student Code</th>
                            <th>Gender</th>
                            <th>Date of Birth</th>
                            <th>Action</th> -->
                        </tr>
                    </thead>
                    <tbody id="showdata">
                        <!-- <?php if (isset($_POST['addtoclass'])) { ?> -->

                        <!-- <?php if (isset($addtoclass)) { ?> -->
                        <?php foreach ($addtoclass as $value) { ?>
                        <tr>
                            <td><?php
                                            if (isset($_GET['page']) && $_GET['page'] > 1)
                                                echo ($_GET['page'] - 1) * 10 + ($key + 1);
                                            else
                                                echo ($key + 1);
                                    ?></td>

                            <td><?php echo $value['Stu_id']; ?></td>
                            <td><?php echo $value['Class_id']; ?></td>
                            <!-- <td><?php echo $value['Stu_code']; ?></td>
                            <td><?php echo $value['Gender']; ?></td>
                            <td><?php echo $value['DOB']; ?></td> -->
                            <!-- <td>
                                <a class="m-2" href="all_condition.php?remove_cid=<?php echo $value['id'] ?>"
                                    onclick="return confirm('Do you want to delete this record?')">
                                    <i class="fa fa-trash text-danger"></i>
                                </a>
                            </td> -->
                        </tr>
                        <?php } ?>
                        <!-- <?php } ?> -->
                        <!-- <?php } else { ?>
                        <tr>
                            <td>No Record Found!</td>
                        </tr>
                        <?php } ?> -->
                    </tbody>
                </table>
            </div>

        </div>
    </div>
    <!-- /.row -->
</section>


<?php include_once 'footer.php'; ?>