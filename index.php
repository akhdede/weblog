    <?php require 'core/init.php'; ?>
    <?php $general->includeHeader(); ?>
    <div class="jumbotron text-center">
      <img src="assets/image/logo.png" alt="">
      <h1 class="display-5">Tentang <span class="title">Linux & Programming</span></h1>
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
    <?php $general->includeFooter(); ?>
