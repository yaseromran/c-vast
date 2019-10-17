import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import {HTTP_INTERCEPTORS, HttpClient, HttpClientModule} from '@angular/common/http';
import { RouterModule } from '@angular/router';
import { DropdownModule } from 'primeng/dropdown';
import {ListboxModule} from 'primeng/listbox';
import {MultiSelectModule} from 'primeng/multiselect';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { BsDropdownModule } from 'ngx-bootstrap';
import { CollapseModule } from 'ngx-bootstrap';
import { TooltipModule } from 'ngx-bootstrap';
import { AgmCoreModule } from '@agm/core';

import { AuthService } from './shared-services/auth-service';
import { AuthInterceptor } from './shared-services/auth.interceptor';
import { SideToFormSignalService } from './cv-services/side-to-form-signal.service';
import { TopToSideSignalService } from './cv-services/top-to-side-signal.service';
import { MapToFormService } from './cv-services/map-to-form.service';
import { ResumeService } from './cv-services/resume.service';
import { MapService } from './cv-services/map.service';
import { PersonalInformationService } from './cv-services/personal-information.service';

import { AppComponent } from './app.component';
import { SidebarComponent } from './sidebar/sidebar.component';
import { HelperComponent } from './helper/helper.component';
import { TopNavbarComponent } from './top-navbar/top-navbar.component';
import { PageNavbarComponent } from './page-navbar/page-navbar.component';
import { CvWrapperComponent } from './cv-wrapper/cv-wrapper.component';
import { LoginComponent } from './login/login.component';
import { ReumeComponent } from './reume/reume.component';
import { MapComponent } from './map/map.component';
import { PersonalInformationComponent } from './personal-information/personal-information.component';
import { ExportUrlService } from './shared-services/export-url.service';
import { AuthGuardService } from './shared-services/auth-guard.service';
import { LoginAuthGuardService } from './shared-services/login-auth-guard.service';

import { TableModule } from 'primeng/table';
import { PersonalInformationPreviewComponent } from './personal-information-preview/personal-information-preview.component';

import {DialogModule} from 'primeng/dialog';

import {AutoCompleteModule} from 'primeng/autocomplete';
import {EditorModule} from 'primeng/editor';
import {TranslateLoader, TranslateModule} from '@ngx-translate/core';
import {TranslateHttpLoader} from '@ngx-translate/http-loader';
import { SectionsManagementComponent } from './sections-management/sections-management.component';
import {SectionsManagementService} from './cv-services/sections-management.service';
import { MultiSelectAllModule } from '@syncfusion/ej2-angular-dropdowns';

import { SocialLoginModule, AuthServiceConfig, GoogleLoginProvider , FacebookLoginProvider } from 'angular5-social-login';
import { getAuthServiceConfigs } from 'socialloginConfig';

@NgModule({
  declarations: [
    AppComponent,
    SidebarComponent,
    HelperComponent,
    TopNavbarComponent,
    PageNavbarComponent,
    CvWrapperComponent,
    LoginComponent,
    ReumeComponent,
    MapComponent,
    PersonalInformationComponent,
    PersonalInformationPreviewComponent,
    SectionsManagementComponent,


  ],
  imports: [
    BrowserModule,
    BsDropdownModule.forRoot(),
    CollapseModule.forRoot(),
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,

    BrowserAnimationsModule,
    TableModule,

    // Angular 4 MultiSelect Dropdown Modules
    MultiSelectAllModule,


    // facebook & google config
    SocialLoginModule,

    // PrimeNG Modules
    DropdownModule,
    DialogModule,
    ListboxModule,
    MultiSelectModule,
    AutoCompleteModule,
    EditorModule,
    TooltipModule.forRoot(),
    RouterModule.forRoot([

      {path: '', component: LoginComponent, canActivate: [LoginAuthGuardService]},
      {path: 'resumes', component: ReumeComponent},
      {
        path: 'resume-wrapper/:resumeId', component: CvWrapperComponent, children: [

          {path: 'personal', component: PersonalInformationComponent},
          {path: 'personal-preview', component: PersonalInformationPreviewComponent},
        ], canActivate: [AuthGuardService]
      },
    ]),
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyC-kUEblRvoCisok3orhhnw3aMqZfPCdFo',
      libraries: ['places']
    }),
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: (HttpLoaderFactory),
        deps: [HttpClient]
      }
    })
  ],
  providers: [
    TopToSideSignalService,
    SideToFormSignalService,
    MapToFormService,
    AuthService,
   // SocialLoginModule.in
    // facebook & google config
    {provide: AuthServiceConfig, useFactory: getAuthServiceConfigs},

    {provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true},
    // {provide: HTTP_INTERCEPTORS, useClass: HttpErrorInterceptor,multi: true},
    MapService,
    PersonalInformationService,
    ResumeService,
    ExportUrlService,

    AuthGuardService,

    LoginAuthGuardService,
    SectionsManagementService // ,
   // SocialLoginModule.initialize(getAuthServiceConfigs)

  ],
  bootstrap: [AppComponent]
})
export class AppModule {

}

export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http, 'assets/i18n/', '.json');
}
