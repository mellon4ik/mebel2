<?php echo $header; ?><?php echo $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
                </div>
                <div class="panel-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-filter" class="form-horizontal">
                        <div class="form-group required">
                            <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
                            <div class="col-sm-10">
                                <?php foreach ($languages as $language) { ?>
                                    <div class="input-group">
                                        <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                        <input type="text" name="coolfilter_group_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($coolfilter_group_description[$language['language_id']]) ? $coolfilter_group_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
                                    </div>
                                    <?php if (isset($error_name[$language['language_id']])) { ?>
                                        <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                                    <?php } ?>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><?php echo $entry_categories; ?></label>
                            <div class="scrollbox">
                                <?php $class = 'odd'; ?>
                                <?php foreach ($categories as $category) { ?>
                                    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                    <div class="<?php echo $class; ?>">
                                        <?php if (in_array($category['category_id'], $option_categories)) { ?>
                                            <input type="checkbox" name="category_id[]" value="<?php echo $category['category_id']; ?>" checked="checked"/>
                                            <?php echo $category['name']; ?>
                                        <?php } else { ?>
                                            <input type="checkbox" name="category_id[]" value="<?php echo $category['category_id']; ?>"/>
                                            <?php echo $category['name']; ?>
                                        <?php } ?>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

<?php echo $footer; ?>