<?php require 'core/init.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>dedeirwanto.com</title>
  <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
  <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <a class="navbar-brand" href="#">Dede's Weblog</a>

      <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Tentang</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Kategori</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Post</a>
          </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Search</button>
        </form>
      </div>
    </nav>
    <div class="jumbotron text-center">
      <img src="assets/image/logo.png" alt="">
      <h1 class="display-5">Tentang <span class="title">Programming</span></h1>
      <p class="lead">Dokumentasi seorang pemula</p>
      <a class="btn btn-primary btn-lg" href="#" role="button">Selanjutnya</a>
    </div>
  </header>

  <section>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h3 class="display-5">Posts</h3>
        </div>

        <?php $query = "SELECT * FROM posts"; $recordsPerPage = 8; ?>

        <?php $page = $general->page($query, $recordsPerPage); ?>

        <?php $posts = $index->getPosts($page); foreach($posts as $p): ?>
            <div class="col-md-3">
              <div class="card mb-3 shadow-sm">
				<img class="card-img-top" src="assets/image/xxx.png" alt="Card image cap">
                <div class="card-body" style="height: 170px;">
                  <p class="card-title"><a class="nav-link" href="<?= $p['link'] ?>"><?= $p['judul'] ?></a></p>
                </div>
                <div class="card-footer">
                  <div class="d-flex justify-content-between align-items-center">
                    <small class="text-muted"><?= $index->getAuthors($p['authors']) ?></small>
                    <small class="text-muted align-items-right"><?= $general->tglIndo($p['tanggal_posting']) ?></small>
                  </div>
                </div>
              </div>
            </div>

        <?php endforeach; ?>

        <?php $general->pageLink($query, $recordsPerPage); ?>

      </div>
    </div>
  </section>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-3">
          <h3 class="display-5">Tentang</h3>
        </div>
        <div class="col-3">
          <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link" href="#">Kategori</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Post</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>

  <script src="assets/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
</body>
</html>
