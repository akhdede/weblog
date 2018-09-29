<?php require 'core/init.php' ?>
<?php $general->includeHeader(); ?>
</header>
<section>

<div class="container">
  <div class="row">

        <!-- get posting by id -->
        <?php if(isset($_GET['id'])){ $id = $_GET['id']; $query = "SELECT `judul` FROM `posts` WHERE `id` =  $id"; ?>
            <div class="col-md-12">
                <?= $general->breadcrumb('post', $query); ?>
            </div>
            <div class="col-md-8">
                <div class="col-md-12">
                    <?php $post = $index->getPostDetails($id); foreach($post as $p): ?>
                    <div class="blog-post">
                      <h2 class="blog-post-title"><?= $p['judul']?></h2>
                      <p class="blog-post-meta"><?= $general->tglIndo($p['tanggal_posting']) ?> oleh <a href="#"><?= $index->getAuthors($p['authors']) ?></a></p>
                      <p><img src="assets/image/xxx.jpg"></p>
                      <p><?= $p['konten']?></p>
                    </div>
                </div>
            </div>
        <?php endforeach; } else { ?>

            <!-- all post -->
            <div class="col-md-12">
                <?= $general->breadcrumb('post'); ?>
            </div>

            <div class="col-md-8">
                <div class="col-md-12">
                    <?php
                    $query = "SELECT * FROM `posts`";
                    $recordsPerPage = 10;
                    $page = $general->page($query, $recordsPerPage);
                    $posts = $index->getPosts($page);
                    foreach($posts as $p):
                    ?>
                    <div class="blog-post">
                        <h5 class="blog-post-title"><a href="<?= $p['link'] ?>"><?= $p['judul'] ?></a></h5>
                        <p class="blog-post-meta"><?= $general->tglIndo($p['tanggal_posting']) ?> oleh <a href="#"><?= $index->getAuthors($p['authors']) ?></a></p>
                    </div>
                    <hr>
                    <?php endforeach; ?>
                </div>
                <?= $general->pageLink($query, $recordsPerPage) ?>
            </div>
        <?php } ?>
    <div class="col-md-4">
          <div class="p-3">
            <h4 class="font-weight-bold">Recent Post</h4>
            <ol class="list-unstyled mb-0">
              <?php $recent = $index->recentPost(); foreach($recent as $r) : ?>
                  <li><a class="text-secondary" href="<?= $r['link']?>" style="text-decoration: none;"><?= $r['judul'] ?></a></li><hr>
              <?php endforeach; ?>
            </ol>
          </div>
    </div>
  </div>
</div>
</section>
<?php $general->includeFooter(); ?>
