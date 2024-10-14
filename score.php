<?php
include_once 'connection.php';
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}



$sql = "SELECT * FROM tb_student ORDER BY ID ASC limit 5";
$stmt = $conn->prepare($sql);
$stmt->execute();
$Student = $stmt->fetchAll(PDO::FETCH_ASSOC);

$sql = "SELECT * from tb_subject order by SubID ASC limit 3";
$stmt = $conn->prepare($sql);
$stmt->execute();
$Subject = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<?php include_once 'header.php'; ?>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <pre>
                <?php print_r($_POST); ?>
            </pre>
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>List Students</h1>
                </div>
                <div class="col-sm-6">
                    <!-- <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Simple Tables</li>
            </ol> -->
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- /.col -->
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">

                        </div>
                        <!-- /.card-header -->
                        <form action="" method="post" name="formscore">
                            <div class="card-body p-0">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 10px">#</th>
                                            <th>Student Name</th>
                                            <th>Gender</th>
                                            <?php foreach ($Subject as $key => $value): ?>

                                                <th class="text-center"><?php echo $value['Subject_name']; ?></th>

                                            <?php endforeach ?>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($Student as $key => $value): ?>
                                            <tr>
                                                <td><?php echo $key + 1; ?>.</td>
                                                <td><?php echo $value['En_name']; ?></td>
                                                <td><?php echo $value['Gender']; ?></td>
                                                <?php foreach ($Subject as $k1 => $v1): ?>
                                                    <td style="padding:0px">
                                                        <input type="number" class="form-control text-center"
                                                            name="scorebox[<?php echo $value['ID']; ?>] [<?php echo $v1['SubID']; ?>]">
                                                    </td>
                                                <?php endforeach ?>
                                            </tr>
                                        <?php endforeach ?>
                                    </tbody>
                                </table>
                            </div>

                            <div class="card-footer">
                                <div class="card-tools">
                                    <button class="btn btn-primary" type="submit" name="btnsubmit"><i
                                            class="fa fa-save"></i> Save Score</button>
                                </div>
                            </div>
                        </form>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->


<?php include_once 'footer.php'; ?>