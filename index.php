<?php include "connection.php";

if (session_status() === PHP_SESSION_NONE) {
    session_start();
    if (!isset($_SESSION['user'])) {
        // Redirect to login page or display an error message
        header('Location: login_role.php');
        exit;
    }
}



?>

<?php include_once 'header.php'; ?>


<div class="content-wrapper">
    <!-- <?php
            if (isset($_GET['backup']) && $_GET['backup'] === 'success') {
                echo "<p>Backup completed successfully!</p>";
            } else {
                echo "<p>Backup failed!</p>";
            }
            ?> -->
    <!-- Content Header (Page header) -->
    <?php var_dump($_SESSION['role']); ?>
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">|Dashboard</h1>
                </div><!-- /.col -->
                <!-- <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard v2</li>
                    </ol>
                </div> -->
                <!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <!-- Info boxes -->
            <div class="row">
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="info-box">
                        <span class="info-box-icon bg-info elevation-1"><i class="fas fa-users"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">All Students</span>
                            <span class="info-box-number">
                                <?php
                                $sql  = "SELECT ID FROM tb_student";
                                $stmt = $conn->prepare($sql);
                                $stmt->execute();
                                $all = $stmt->fetchAll(PDO::FETCH_ASSOC);
                                echo Count($all);
                                ?>
                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="info-box mb-3">
                        <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-user"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">All Teachers</span>
                            <span class="info-box-number">
                                <?php
                                $sql  = "SELECT id FROM tb_teacher";
                                $stmt = $conn->prepare($sql);
                                $stmt->execute();
                                $all = $stmt->fetchAll(PDO::FETCH_ASSOC);
                                echo Count($all);
                                ?>
                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->

                <!-- fix for small devices only -->
                <div class="clearfix hidden-md-up"></div>

                <div class="col-12 col-sm-6 col-md-3">
                    <div class="info-box mb-3">
                        <span class="info-box-icon bg-success elevation-1"><i class="fas fa-school"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">All Class</span>
                            <span class="info-box-number">
                                <?php
                                $sql  = "SELECT ClassID FROM tb_class";
                                $stmt = $conn->prepare($sql);
                                $stmt->execute();
                                $all = $stmt->fetchAll(PDO::FETCH_ASSOC);
                                echo Count($all);
                                ?>
                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="info-box mb-3">
                        <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-graduation-cap"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">All Courses</span>
                            <span class="info-box-number">
                                <?php
                                $sql  = "SELECT id FROM tb_course";
                                $stmt = $conn->prepare($sql);
                                $stmt->execute();
                                $all = $stmt->fetchAll(PDO::FETCH_ASSOC);
                                echo Count($all);
                                ?>
                            </span>
                        </div>
                        <!-- /.info-box-content -->
                    </div>
                    <!-- /.info-box -->
                </div>
                <!-- /.col -->
            </div>
        </div>
</div>
<!-- /.row -->


<?php include_once 'footer.php'; ?>