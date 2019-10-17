import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'helper',
  templateUrl: './helper.component.html',
  styleUrls: ['./helper.component.css']
})
export class HelperComponent implements OnInit {

  helperStatus = "hide-helper";
  constructor() { }

  ngOnInit() {
  }
  changeHelperStatus(){
    if (this.helperStatus == "hide-helper"){
      this.helperStatus = '';
    }else{
      this.helperStatus = 'hide-helper';
    }

  }

}
