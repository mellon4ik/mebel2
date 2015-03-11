<?php echo $header; ?>
<?php echo $column_left; ?>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form-simple-blog-category" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                </div>

                <h1><?php echo $heading_title; ?></h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>

        <div class="container-fluid">
            <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>

            <?php if ($success) { ?>
                <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
                </div>

                <div class="panel-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-simple-blog-category" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><span data-toggle="tooltip" title="<?php echo $help_search_article; ?>"><?php echo $entry_search_article; ?></label>

                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">

                                <div class="checkbox-inline">
                                    <?php if ($simple_blog_category_search_article) { ?>
                                        <input type="radio" name="simple_blog_category_search_article" value="1" checked="checked"/> <?php echo $text_enabled; ?>&nbsp;
                                        <input type="radio" name="simple_blog_category_search_article" value="0"/> <?php echo $text_disabled; ?>
                                    <?php } else { ?>
                                        <input type="radio" name="simple_blog_category_search_article" value="1"/> <?php echo $text_enabled; ?>&nbsp;
                                        <input type="radio" name="simple_blog_category_search_article" value="0" checked="checked"/> <?php echo $text_disabled; ?>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php echo $footer; ?>