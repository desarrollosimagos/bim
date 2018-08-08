<br>
<br>
<br>
<!--
<br>
-->

<style>
	.learn-more {
		background-color: #1B426C !important;
		width: 90%;
	}
</style>

<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h1><?php echo $get_detail->name;?></h1>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
	
<!--
	<div id="inSlider" class="carousel carousel-fade" data-ride="carousel">
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<div class="header-back one">
					<?php if($get_detail->image != null){ ?>
					<img class='img-fluid' src="<?php echo assets_url("img/projects/$get_detail->image");?>" alt="laptop" style='width: 100%;height: 100%;'/>
					<?php }else{ ?>
					<img class='img-fluid' src="<?php echo assets_url("img/landing/shattered.png");?>" alt="laptop" style='width: 100%;height: 100%;'/>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
-->
	
	<!-- Apertura de la sección de datos estadísticos del proyecto -->
	<div class="row">
		<div class="col-lg-12">

			<div class="ibox product-detail">
				<div class="ibox-content">

					<div class="row">
						<div class="col-md-8">

							<div class="carousel slide" id="carousel2">
                                <ol class="carousel-indicators">
									<?php 
									if(count($fotos_asociadas) > 0){
										$i = 0;
										foreach($fotos_asociadas as $foto){
											if($i == 0){
												echo "<li data-slide-to='".$i."' data-target='#carousel2' class='active'></li>";
											}else{
												echo "<li data-slide-to='".$i."' data-target='#carousel2'></li>";
											}
											$i++;
										}
                                    }else{
										echo "<li data-slide-to='0' data-target='#carousel2' class='active'></li>";
                                    } 
                                    ?>
                                </ol>
                                <div class="carousel-inner">
									<?php 
									if(count($fotos_asociadas) > 0){
										$i = 0;
										foreach($fotos_asociadas as $foto){
											if($i == 0){
												echo "<div class='item active'>
														<img alt='image'  class='img-responsive' src='".assets_url("img/projects/$foto->photo")."'>
														<div class='carousel-caption'>
															<p>Imagen ".($i+1)."</p>
														</div>
													</div>";
											}else{
												echo "<div class='item'>
														<img alt='image' class='img-responsive' src='".assets_url("img/projects/$foto->photo")."'>
														<div class='carousel-caption'>
															<p>Imagen ".($i+1)."</p>
														</div>
													</div>";
											}
											$i++;
										}
                                    }else{
										echo "<div class='item active'>
												<img alt='image'  class='img-responsive' src='".assets_url("img/landing/shattered.png")."'>
												<div class='carousel-caption'>
													<p>This is default image</p>
												</div>
											</div>";
                                    } 
                                    ?>
                                    
                                </div>
                                <a data-slide="prev" href="#carousel2" class="left carousel-control">
                                    <span class="icon-prev"></span>
                                </a>
                                <a data-slide="next" href="#carousel2" class="right carousel-control">
                                    <span class="icon-next"></span>
                                </a>
                            </div>

						</div>
						<div class="col-md-4">

							<div class="row m-t-lg">
								<div class="col-md-4">
									<h5><strong>15k</strong></h5>
									<span class="label label-success"><?php echo $this->lang->line('public_view_minimum_projects'); ?></span>
								</div>
								<div class="col-md-4">
									<h5><strong>368</strong></h5>
									<span class="label label-success"><?php echo $this->lang->line('public_view_variable_projects'); ?></span>
								</div>
								<div class="col-md-4">
									<h5><strong>14m</strong></h5>
									<span class="label label-success"><?php echo $this->lang->line('public_view_variable_projects'); ?></span>
								</div>
							</div>
							
							<hr>

							<div class="small text-muted">
								<div>Campo Variable 1</div>
							</div>
							
							<hr>

							<div class="small text-muted">
								Campo Variable 1
							</div>
							
							<hr>

							<div class="small text-muted">
								Campo Variable 1
							</div>
							
							<hr>

							<div class="small text-muted">
								Campo Variable 1
							</div>
							
							<hr>
							
							<div>
								<div class="ibox-content">
									<h5><?php echo $this->lang->line('public_view_usage_projects'); ?></h5>
									<div class="col-lg-12">
										<div class="col-md-6 text-left">
											<h2>$1.500.500</h2>
										</div>
										<div class="col-md-6 text-right">
											<h2>65%<i class="fa fa-bolt text-navy"></i></h2>
										</div>
									</div>
									<br>
									<br>
									<div class="progress progress-mini">
										<div style="width: 68%;" class="progress-bar"></div>
									</div>
									<br>
									<div class="m-t-sm text-center">
										<i class="fa fa-clock-o fa-1.5x"></i>
										<?php 
										// Imprimimos la fecha de la base de datos primero convirtiéndola como tal y luego dándole formato
										echo date_format(date_create($get_detail->date), 'jS F Y');
										?>
									</div>
								</div>
							</div>
							
							<div class="row user-button">
								<div class="row">
									<div class="col-md-12" align="center">
										<a type="button" class="btn btn-primary btn-sm btn-block b-r-xl learn-more">
										<i class="fa fa-line-chart fa-1.5x"></i>
										<?php echo $this->lang->line('public_view_invest_projects'); ?>
										</a>
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>
				
			</div>

		</div>
	</div>
	<!-- Cierre de la sección de datos estadísticos del proyecto -->
	
	<!-- Apertura de la sección de descripción del proyecto -->
	<div class="row article">
		<div class="col-lg-12">
			<div class="ibox">
				<div class="ibox-content">
					<p>
						<?php echo $get_detail->description;?>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Cierre de la sección de descripción del proyecto -->
	
	<!-- Apertura de la sección de documentos y lecturas recomendadas -->
	<div class="row article">
		<div class="col-lg-12">
			<div class="col-md-2">
			
			</div>
			<div class="col-md-4">
				<h2><?php echo $this->lang->line('public_view_documents_projects'); ?></h2>
				<?php if(count($documentos_asociados) > 0){ ?>
				<ul class="list-unstyled project-files">
					<?php foreach($documentos_asociados as $doc){ ?>
					<li>
						<a target="_blank" href="<?php echo base_url(); ?>assets/documents/<?php echo $doc->description; ?>">
							<i class="fa fa-file"></i> <?php echo $doc->description; ?>
						</a>
					</li>
					<?php } ?>
				</ul>
				<?php } ?>
			</div>
			<div class="col-md-4">
				<h2><?php echo $this->lang->line('public_view_readings_projects'); ?></h2>
				<?php if(count($lecturas_asociadas) > 0){ ?>
				<ul class="list-unstyled project-files">
					<?php foreach($lecturas_asociadas as $reading){ ?>
					<li>
						<a target="_blank" href="<?php echo base_url(); ?>assets/readings/<?php echo $reading->description; ?>">
							<i class="fa fa-file"></i> <?php echo $reading->description; ?>
						</a>
					</li>
					<?php } ?>
				</ul>
				<?php } ?>
			</div>
			<div class="col-md-2">
			
			</div>
		</div>
	</div>
	<!-- Cierre de la sección de documentos y lecturas recomendadas -->
	
</div>
