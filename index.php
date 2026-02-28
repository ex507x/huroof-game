<?php
session_start();
require_once __DIR__ . '/includes/db.php';
?>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>تحدي الحروف - وقف أونلاين</title>
    <link rel="stylesheet" href="public/styles.css" />
</head>
<body>
    <nav>
        <div class="container">
            <div class="nav-brand">🎮 تحدي الحروف</div>
            <div class="nav-links">
                <?php if (isset($_SESSION['user_id'])): ?>
                    <a href="play.php">العب الآن</a>
                    <a href="leaderboard.php">الصدارة</a>
                    <a href="profile.php">ملفي</a>
                    <a href="logout.php">خروج</a>
                <?php else: ?>
                    <a href="login.php">دخول</a>
                    <a href="register.php">تسجيل جديد</a>
                <?php endif; ?>
            </div>
        </div>
    </nav>
    
    <main class="container">
        <div class="hero">
            <h1>🎮 تحدي الحروف - وقف أونلاين</h1>
            <p>اختبر معلوماتك وتحدى أصدقائك في هذه اللعبة الممتعة!</p>
            <a href="register.php" class="btn btn-primary">ابدأ اللعب الآن</a>
        </div>
        
        <div class="features">
            <div class="feature-card">
                <span class="icon">⏱️</span>
                <h3>مؤقت زمني</h3>
                <p>60 ثانية للإجابة على جميع التصنيفات</p>
            </div>
            <div class="feature-card">
                <span class="icon">🏆</span>
                <h3>لوحة صدارة</h3>
                <p>نافس اللاعبين الآخرين واحصل على المركز الأول</p>
            </div>
            <div class="feature-card">
                <span class="icon">👥</span>
                <h3>لعب جماعي</h3>
                <p>العب مع أصدقائك أونلاين</p>
            </div>
        </div>
    </main>
</body>
</html>