<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>P-Cost System</title>
</head>
<body>
    <h1>ยินดีต้อนรับสู่ระบบ P-Cost</h1>
    <?php
    require_once 'config/db_connect.php';
    if (isset($pdo)) {
        echo "<p>เชื่อมต่อกับฐานข้อมูลสำเร็จ</p>";
    } else {
        echo "<p>เกิดข้อผิดพลาดในการเชื่อมต่อกับฐานข้อมูล</p>";
    }
    ?>
</body>
</html>