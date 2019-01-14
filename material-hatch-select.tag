<hatch-cargo-select style="padding:5px">

  <input type="hidden" class="hatch_cargo" value="{opts.position}-{hatch_code}-{cargo_code}">

  <!-- Dropdown Trigger -->
  <a class='dropdown-trigger btn btn-large {hatch : hatch || ss_hatch || pre_hatch } { cargo : cargo || ss_cargo || pre_cargo }'
      href='#' id="trigger_{opts.position}" 
      data-target='{opts.position}'>{opts.position}</a>

  <!-- Dropdown Structure -->

  <ul id='{opts.position}' class='dropdown-content'>
    <div class="status_code">{opts.position}-{hatch_code}-{cargo_code}</div>
    <li class="divider" tabindex="-1"></li>

    <li class="normal">
      <a class="active" onclick="{toggle_hatch}" href="#!">
        <i class="material-icons">{ hatch ? 'checkbox': 'check_box_outline_blank' }</i>
        HATCH
      </a>
    </li>
    <li class="normal">
      <a onclick="{toggle_cargo}" href="#!">
        <i class="material-icons">{ cargo ? 'checkbox': 'check_box_outline_blank' }</i>
        CARGO
      </a>
    </li>

    <li class="sandstorm divider" tabindex="-1"></li>
    <li class="sandstorm">
      <a onclick="{toggle_ss_hatch}" href="#!">
        <i class="material-icons">{ ss_hatch ? 'checkbox': 'check_box_outline_blank' }</i>
        SS HATCH
      </a>
    </li>
    <li class="sandstorm">
      <a onclick="{toggle_ss_cargo}" href="#!">
        <i class="material-icons">{ ss_cargo ? 'checkbox': 'check_box_outline_blank' }</i>
        SS CARGO
      </a>
    </li>

    <li class="preload divider" tabindex="-1"></li>
    <li class="preload">
      <a onclick="{toggle_pre_hatch}" href="#!">
        <i class="material-icons">{ pre_hatch ? 'checkbox': 'check_box_outline_blank' }</i>
        Pre HATCH
      </a>
    </li>
    <li class="preload">
      <a onclick="{toggle_pre_cargo}" href="#!">
        <i class="material-icons">{ pre_cargo ? 'checkbox': 'check_box_outline_blank' }</i>
        Pre CARGO
      </a>
    </li>

  </ul>




<style>

  .status_code{
    font-size:1.3em;
    font-weight:600;
  }

  .dropdown-trigger.hatch{
    border:5px solid #ffbb21;
    border-radius:10px;
  }

  .dropdown-trigger{
    background-color: #688198;
  }

  .dropdown-trigger.cargo{
    background-color: #ff7f12;
  }

</style>

<script>

   // store the top level 'this' reference as a variable
   var self = this;

   self.hatch = false;
   self.cargo = false;

   self.ss_hatch = false;
   self.ss_cargo = false;

   self.pre_hatch = false;
   self.pre_cargo = false;

   self.hatch_code = '';
   self.cargo_code = '';

   this.on('mount', function(){
    var elem = document.querySelector('#trigger_' + opts.position );
    var instance = M.Dropdown.init(elem, {
      closeOnClick: false,
      constrainWidth:false
    });
   });

  this.toggle_hatch = function(){
    self.hatch = !self.hatch;
    if( self.ss_hatch ){
      self.ss_hatch = false;
    }

    self.update_codes();
  }

  this.toggle_cargo = function(){
    self.cargo = !self.cargo;
    if( self.ss_cargo ){
      self.ss_cargo = false;
    }

    self.update_codes();
  }


  this.toggle_ss_hatch = function(){
    self.ss_hatch = !self.ss_hatch;
    if( self.ss_hatch ){
      self.hatch = false;
    }
    self.update_codes();
  }

  this.toggle_ss_cargo = function(){
    self.ss_cargo = !self.ss_cargo;
    if( self.ss_cargo ){
      self.cargo = false;
    }
    self.update_codes();
  }

  this.toggle_pre_hatch = function(){
    self.pre_hatch = !self.pre_hatch;
    if( self.pre_hatch ){
      self.hatch = false;
      self.ss_hatch = false;
    }
    self.update_codes();
  }

  this.toggle_pre_cargo = function(){
    self.pre_cargo = !self.pre_cargo;
    if( self.pre_cargo ){
      self.cargo = false;
      self.ss_cargo = false;
    }
    self.update_codes();
  }

  this.update_codes = function(){

    self.hatch_code = '';
    if( self.ss_hatch ){
      self.hatch_code= 'SSH';
    }
    if( self.pre_hatch ){
      self.hatch_code = 'PREH';
    }
    if( self.hatch ){
      self.hatch_code = 'H';
    }

    self.cargo_code = '';
    if( self.cargo ){
      self.cargo_code = 'C';
    }
    if( self.pre_cargo ){
      self.cargo_code = 'PREC';
    }

    if( self.ss_cargo ){
      self.cargo_code = 'SSC';
    }

  }


  </script>

</hatch-cargo-select>
