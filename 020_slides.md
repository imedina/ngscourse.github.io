




<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>ngscourse.github.io/COURSE_MATERIALS/rna-seq/slides/020_slides.md at master · ngscourse/ngscourse.github.io · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <meta property="fb:app_id" content="1401488693436528"/>

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="ngscourse/ngscourse.github.io" name="twitter:title" /><meta content="ngscourse.github.io - NGS data analysis course" name="twitter:description" /><meta content="https://identicons.github.com/904a39ff7c8c151da34812ea1b1ed8ea.png" name="twitter:image:src" />
<meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://identicons.github.com/904a39ff7c8c151da34812ea1b1ed8ea.png" property="og:image" /><meta content="ngscourse/ngscourse.github.io" property="og:title" /><meta content="https://github.com/ngscourse/ngscourse.github.io" property="og:url" /><meta content="ngscourse.github.io - NGS data analysis course" property="og:description" />

    <meta name="hostname" content="github-fe122-cp1-prd.iad.github.net">
    <meta name="ruby" content="ruby 2.1.0p0-github-tcmalloc (87d8860372) [x86_64-linux]">
    <link rel="assets" href="https://github.global.ssl.fastly.net/">
    <link rel="conduit-xhr" href="https://ghconduit.com:25035/">
    <link rel="xhr-socket" href="/_sockets" />


    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="C1907F0C:22D7:71507F0:52FE418A" name="octolytics-dimension-request_id" />
    

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="1XxU4rY5kimPVGDlOxBKOsU/8NYZRuhr51N7VSfFCiw=" name="csrf-token" />

    <link href="https://github.global.ssl.fastly.net/assets/github-08872a782b4e7a43359fe1ec1cddae22f0ab6337.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://github.global.ssl.fastly.net/assets/github2-1fd5e16a69afc6346135798e696916b9f2c288c9.css" media="all" rel="stylesheet" type="text/css" />
    
    


      <script src="https://github.global.ssl.fastly.net/assets/frameworks-693e11922dcacc3a7408a911fe1647da4febd3bd.js" type="text/javascript"></script>
      <script async="async" defer="defer" src="https://github.global.ssl.fastly.net/assets/github-1b360c0c94bb4b45360ca46b8d7045ece023554f.js" type="text/javascript"></script>
      
      <meta http-equiv="x-pjax-version" content="29ce77634407ee55f283adbd60069821">

        <link data-pjax-transient rel='permalink' href='/ngscourse/ngscourse.github.io/blob/85dc897ff8c7045fab4ff4ea78ae864e5a819bd9/COURSE_MATERIALS/rna-seq/slides/020_slides.md'>

  <meta name="description" content="ngscourse.github.io - NGS data analysis course" />

  <meta content="6677445" name="octolytics-dimension-user_id" /><meta content="ngscourse" name="octolytics-dimension-user_login" /><meta content="16821624" name="octolytics-dimension-repository_id" /><meta content="ngscourse/ngscourse.github.io" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="16821624" name="octolytics-dimension-repository_network_root_id" /><meta content="ngscourse/ngscourse.github.io" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/ngscourse/ngscourse.github.io/commits/master.atom" rel="alternate" title="Recent Commits to ngscourse.github.io:master" type="application/atom+xml" />

  </head>


  <body class="logged_out  env-production  vis-public page-blob tipsy-tooltips">
    <div class="wrapper">
      
      
      
      


      
      <div class="header header-logged-out">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/">
      <span class="mega-octicon octicon-logo-github"></span>
    </a>

    <div class="header-actions">
        <a class="button primary" href="/join">Sign up</a>
      <a class="button signin" href="/login?return_to=%2Fngscourse%2Fngscourse.github.io%2Fblob%2Fmaster%2FCOURSE_MATERIALS%2Frna-seq%2Fslides%2F020_slides.md">Sign in</a>
    </div>

    <div class="command-bar js-command-bar  in-repository">

      <ul class="top-nav">
          <li class="explore"><a href="/explore">Explore</a></li>
        <li class="features"><a href="/features">Features</a></li>
          <li class="enterprise"><a href="https://enterprise.github.com/">Enterprise</a></li>
          <li class="blog"><a href="/blog">Blog</a></li>
      </ul>
        <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">

<input type="text" data-hotkey="/ s" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
    
      data-repo="ngscourse/ngscourse.github.io"
      data-branch="master"
      data-sha="f3cf6c44910d943dd0291754c0dd20719739ceac"
  >

    <input type="hidden" name="nwo" value="ngscourse/ngscourse.github.io" />

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item js-this-repository-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked" />
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item js-all-repositories-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global" />
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="octicon help tooltipped downwards" aria-label="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

</form>
    </div>

  </div>
</div>




          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        

<ul class="pagehead-actions">


  <li>
    <a href="/login?return_to=%2Fngscourse%2Fngscourse.github.io"
    class="minibutton with-count js-toggler-target star-button tooltipped upwards"
    aria-label="You must be signed in to use this feature" rel="nofollow">
    <span class="octicon octicon-star"></span>Star
  </a>

    <a class="social-count js-social-count" href="/ngscourse/ngscourse.github.io/stargazers">
      0
    </a>

  </li>

    <li>
      <a href="/login?return_to=%2Fngscourse%2Fngscourse.github.io"
        class="minibutton with-count js-toggler-target fork-button tooltipped upwards"
        aria-label="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-git-branch"></span>Fork
      </a>
      <a href="/ngscourse/ngscourse.github.io/network" class="social-count">
        0
      </a>
    </li>
</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="repo-label"><span>public</span></span>
          <span class="mega-octicon octicon-repo"></span>
          <span class="author">
            <a href="/ngscourse" class="url fn" itemprop="url" rel="author"><span itemprop="title">ngscourse</span></a>
          </span>
          <span class="repohead-name-divider">/</span>
          <strong><a href="/ngscourse/ngscourse.github.io" class="js-current-repository js-repo-home-link">ngscourse.github.io</a></strong>

          <span class="page-context-loader">
            <img alt="Octocat-spinner-32" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">
      

      <div class="repository-with-sidebar repo-container new-discussion-timeline js-new-discussion-timeline  ">
        <div class="repository-sidebar clearfix">
            

<div class="sunken-menu vertical-right repo-nav js-repo-nav js-repository-container-pjax js-octicon-loaders">
  <div class="sunken-menu-contents">
    <ul class="sunken-menu-group">
      <li class="tooltipped leftwards" aria-label="Code">
        <a href="/ngscourse/ngscourse.github.io" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-gotokey="c" data-pjax="true" data-selected-links="repo_source repo_downloads repo_commits repo_tags repo_branches /ngscourse/ngscourse.github.io">
          <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

        <li class="tooltipped leftwards" aria-label="Issues">
          <a href="/ngscourse/ngscourse.github.io/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-gotokey="i" data-selected-links="repo_issues /ngscourse/ngscourse.github.io/issues">
            <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
            <span class='counter'>0</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>

      <li class="tooltipped leftwards" aria-label="Pull Requests">
        <a href="/ngscourse/ngscourse.github.io/pulls" aria-label="Pull Requests" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-gotokey="p" data-selected-links="repo_pulls /ngscourse/ngscourse.github.io/pulls">
            <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
            <span class='counter'>0</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>


        <li class="tooltipped leftwards" aria-label="Wiki">
          <a href="/ngscourse/ngscourse.github.io/wiki" aria-label="Wiki" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="repo_wiki /ngscourse/ngscourse.github.io/wiki">
            <span class="octicon octicon-book"></span> <span class="full-word">Wiki</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>
    </ul>
    <div class="sunken-menu-separator"></div>
    <ul class="sunken-menu-group">

      <li class="tooltipped leftwards" aria-label="Pulse">
        <a href="/ngscourse/ngscourse.github.io/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="pulse /ngscourse/ngscourse.github.io/pulse">
          <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" aria-label="Graphs">
        <a href="/ngscourse/ngscourse.github.io/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="repo_graphs repo_contributors /ngscourse/ngscourse.github.io/graphs">
          <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" aria-label="Network">
        <a href="/ngscourse/ngscourse.github.io/network" aria-label="Network" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-selected-links="repo_network /ngscourse/ngscourse.github.io/network">
          <span class="octicon octicon-git-branch"></span> <span class="full-word">Network</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
    </ul>


  </div>
</div>

              <div class="only-with-full-nav">
                

  

<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><strong>HTTPS</strong> clone URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="https://github.com/ngscourse/ngscourse.github.io.git" readonly="readonly">

    <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/ngscourse/ngscourse.github.io.git" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>

  

<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><strong>Subversion</strong> checkout URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="https://github.com/ngscourse/ngscourse.github.io" readonly="readonly">

    <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/ngscourse/ngscourse.github.io" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


<p class="clone-options">You can clone with
      <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>,
      or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <span class="octicon help tooltipped upwards" aria-label="Get help on which URL is right for you.">
    <a href="https://help.github.com/articles/which-remote-url-should-i-use">
    <span class="octicon octicon-question"></span>
    </a>
  </span>
</p>



                <a href="/ngscourse/ngscourse.github.io/archive/master.zip"
                   class="minibutton sidebar-button"
                   title="Download this repository as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          


<!-- blob contrib key: blob_contributors:v21:ffc8ceeec775a84f43c11e0af71e7315 -->

<p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

<a href="/ngscourse/ngscourse.github.io/find/master" data-pjax data-hotkey="t" class="js-show-file-finder" style="display:none">Show File Finder</a>

<div class="file-navigation">
  

<div class="select-menu js-menu-container js-select-menu" >
  <span class="minibutton select-menu-button js-menu-target" data-hotkey="w"
    data-master-branch="master"
    data-ref="master"
    role="button" aria-label="Switch branches or tags" tabindex="0">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax>

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-remove-close js-menu-close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/ngscourse/ngscourse.github.io/blob/master/COURSE_MATERIALS/rna-seq/slides/020_slides.md"
                 data-name="master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target"
                 title="master">master</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="breadcrumb">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/ngscourse/ngscourse.github.io" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">ngscourse.github.io</span></a></span></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/ngscourse/ngscourse.github.io/tree/master/COURSE_MATERIALS" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">COURSE_MATERIALS</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/ngscourse/ngscourse.github.io/tree/master/COURSE_MATERIALS/rna-seq" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">rna-seq</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/ngscourse/ngscourse.github.io/tree/master/COURSE_MATERIALS/rna-seq/slides" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">slides</span></a></span><span class="separator"> / </span><strong class="final-path">020_slides.md</strong> <span class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="COURSE_MATERIALS/rna-seq/slides/020_slides.md" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


  <div class="commit file-history-tease">
    <img alt="Marta" class="main-avatar js-avatar" data-user="1344027" height="24" src="https://1.gravatar.com/avatar/72e362e16bd6a2ad7b1d59c3278a90ef?d=https%3A%2F%2Fidenticons.github.com%2Fed3d5622de977633810697da64d5ba3d.png&amp;r=x&amp;s=140" width="24" />
    <span class="author"><a href="/mbleda" rel="author">mbleda</a></span>
    <time class="js-relative-date" data-title-format="YYYY-MM-DD HH:mm:ss" datetime="2014-02-14T08:01:40-08:00" title="2014-02-14 08:01:40">February 14, 2014</time>
    <div class="commit-title">
        <a href="/ngscourse/ngscourse.github.io/commit/85dc897ff8c7045fab4ff4ea78ae864e5a819bd9" class="message" data-pjax="true" title="Update 020_slides.md">Update 020_slides.md</a>
    </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>2</strong> contributors</a></p>
          <a class="avatar tooltipped downwards" aria-label="mbleda" href="/ngscourse/ngscourse.github.io/commits/master/COURSE_MATERIALS/rna-seq/slides/020_slides.md?author=mbleda"><img alt="Marta" class=" js-avatar" data-user="1344027" height="20" src="https://1.gravatar.com/avatar/72e362e16bd6a2ad7b1d59c3278a90ef?d=https%3A%2F%2Fidenticons.github.com%2Fed3d5622de977633810697da64d5ba3d.png&amp;r=x&amp;s=140" width="20" /></a>
    <a class="avatar tooltipped downwards" aria-label="dmontaner" href="/ngscourse/ngscourse.github.io/commits/master/COURSE_MATERIALS/rna-seq/slides/020_slides.md?author=dmontaner"><img alt="David Montaner" class=" js-avatar" data-user="4466092" height="20" src="https://0.gravatar.com/avatar/e622780dfc8563924df337286fd59970?d=https%3A%2F%2Fidenticons.github.com%2F26ba8f349159b8b216a861cd46bc146d.png&amp;r=x&amp;s=140" width="20" /></a>


    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
          <li class="facebox-user-list-item">
            <img alt="Marta" class=" js-avatar" data-user="1344027" height="24" src="https://1.gravatar.com/avatar/72e362e16bd6a2ad7b1d59c3278a90ef?d=https%3A%2F%2Fidenticons.github.com%2Fed3d5622de977633810697da64d5ba3d.png&amp;r=x&amp;s=140" width="24" />
            <a href="/mbleda">mbleda</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="David Montaner" class=" js-avatar" data-user="4466092" height="24" src="https://0.gravatar.com/avatar/e622780dfc8563924df337286fd59970?d=https%3A%2F%2Fidenticons.github.com%2F26ba8f349159b8b216a861cd46bc146d.png&amp;r=x&amp;s=140" width="24" />
            <a href="/dmontaner">dmontaner</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file-box">
  <div class="file">
    <div class="meta clearfix">
      <div class="info file-name">
        <span class="icon"><b class="octicon octicon-file-text"></b></span>
        <span class="mode" title="File Mode">file</span>
        <span class="meta-divider"></span>
          <span>269 lines (165 sloc)</span>
          <span class="meta-divider"></span>
        <span>7.484 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
              <a class="minibutton disabled tooltipped leftwards" href="#"
                 aria-label="You must be signed in to make or propose changes">Edit</a>
          <a href="/ngscourse/ngscourse.github.io/raw/master/COURSE_MATERIALS/rna-seq/slides/020_slides.md" class="button minibutton " id="raw-url">Raw</a>
            <a href="/ngscourse/ngscourse.github.io/blame/master/COURSE_MATERIALS/rna-seq/slides/020_slides.md" class="button minibutton js-update-url-with-hash">Blame</a>
          <a href="/ngscourse/ngscourse.github.io/commits/master/COURSE_MATERIALS/rna-seq/slides/020_slides.md" class="button minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->
          <a class="minibutton danger disabled empty-icon tooltipped leftwards" href="#"
             aria-label="You must be signed in to make or propose changes">
          Delete
        </a>
      </div><!-- /.actions -->
    </div>
      
  <div id="readme" class="blob instapaper_body">
    <article class="markdown-body entry-content" itemprop="mainContentOfPage"><p>% NGS data analisis course
% <a href="http://www.roadofexcess.org/">The road of excess consortium</a>
% (last update 14-02-2014)</p>

<h1></h1>



<p><a href="https://github-camo.global.ssl.fastly.net/7f6c71e2b4e788877b9cf88ff85cfaf1151a9cf4/687474703a2f2f626c6f672e64657364656c696e75782e6e65742f77702d636f6e74656e742f75706c6f6164732f323031322f31302f6469616772616d2e706e67" target="_blank"><img src="https://github-camo.global.ssl.fastly.net/7f6c71e2b4e788877b9cf88ff85cfaf1151a9cf4/687474703a2f2f626c6f672e64657364656c696e75782e6e65742f77702d636f6e74656e742f75706c6f6164732f323031322f31302f6469616772616d2e706e67" alt="This is the caption" data-canonical-src="http://blog.desdelinux.net/wp-content/uploads/2012/10/diagram.png" style="max-width:100%;"></a></p>

<h1>
<a name="ncbi" class="anchor" href="#ncbi"><span class="octicon octicon-link"></span></a>NCBI</h1>

<ul>
<li><p><strong>National Center for Biotechnology Information</strong> (NCBI)
<a href="http://www.ncbi.nlm.nih.gov/">http://www.ncbi.nlm.nih.gov/</a></p></li>
<li><p>part of the United States National Library of Medicine (NLM)
<a href="https://www.nlm.nih.gov/">https://www.nlm.nih.gov/</a></p></li>
<li><p>a division of the National Institutes of Health (NIH)
<a href="http://www.nih.gov/">http://www.nih.gov/</a></p></li>
</ul><h1>
<a name="resources" class="anchor" href="#resources"><span class="octicon octicon-link"></span></a>Resources</h1>

<p>Databases of biomedical and genomic information for all organisms:</p>

<ul>
<li>Submission

<ul>
<li>GenBank</li>
</ul>
</li>
<li>Databases

<ul>
<li>GenBank</li>
<li>
<strong>RefSeq</strong> </li>
<li>...</li>
</ul>
</li>
<li>Downloads

<ul>
<li>FTP sites</li>
<li>PubMed</li>
</ul>
</li>
<li>Tools

<ul>
<li>Basic Local Alignment Search Tool (BLAST)</li>
<li>...</li>
</ul>
</li>
</ul><p>See: <a href="http://www.ncbi.nlm.nih.gov/guide/all/">http://www.ncbi.nlm.nih.gov/guide/all/</a></p>

<h1>
<a name="documents" class="anchor" href="#documents"><span class="octicon octicon-link"></span></a>Documents</h1>

<p><a href="http://www.ncbi.nlm.nih.gov/books/NBK3831/">NCBI Help Manual</a>:</p>

<ul>
<li>quick overview about topics</li>
<li>usually just FAQs</li>
<li>online (HTML) book</li>
</ul><p><a href="http://www.ncbi.nlm.nih.gov/books/NBK21101/">NCBI Handbook</a>: </p>

<ul>
<li>nice introduction to each tool or database</li>
<li>online (HTML) book</li>
<li>but Chapters may be downloaded in PDF format</li>
<li>see a <a href="http://www.ncbi.nlm.nih.gov/books/NBK21105/">chapter example describing GenBank</a>
</li>
</ul><p>Many other:</p>

<ul>
<li><a href="http://www.ncbi.nlm.nih.gov/books/NBK21106/">Glossary</a></li>
<li><a href="http://www.ncbi.nlm.nih.gov/education/">NCBI Educational Resources</a></li>
</ul><h1>
<a name="entrez-search-and-retrieval-system" class="anchor" href="#entrez-search-and-retrieval-system"><span class="octicon octicon-link"></span></a>Entrez: Search and Retrieval System</h1>

<ul>
<li>the indexing and retrieval system used at the NCBI</li>
<li>used for <strong>all</strong> major NCBI databases:

<ul>
<li>PubMed</li>
<li>Nucleotide and Protein Sequences </li>
<li>Protein Structures</li>
<li>Complete Genomes,</li>
<li>Taxonomy</li>
<li>OMIM</li>
<li>...</li>
</ul>
</li>
<li>
<strong>text-based</strong> searches over several record fields</li>
<li>In practical terms, the <a href="http://www.ncbi.nlm.nih.gov/">web interface</a>
</li>
</ul><h1>
<a name="genbank" class="anchor" href="#genbank"><span class="octicon octicon-link"></span></a>GenBank</h1>

<ul>
<li>collection of publicly available <em>annotated</em> nucleotide sequences and their <strong>protein</strong> translations

<ul>
<li>mRNA sequences with coding regions</li>
<li>segments of genomic DNA with single or multiple genes</li>
<li>ribosomal RNA gene clusters</li>
<li>genome shotgun reads</li>
<li>isolated genes</li>
<li>complete genomes</li>
<li>...</li>
</ul>
</li>
<li>primary sequence data; <strong>not curated</strong>; minor checks done by the NCBI</li>
<li>just authors submit and revise</li>
<li>may have multiple records for same loci</li>
<li>records can contradict each other</li>
<li>no limit to species included</li>
</ul><h1>
<a name="insdc-international-nucleotide-sequence-database-collaboration" class="anchor" href="#insdc-international-nucleotide-sequence-database-collaboration"><span class="octicon octicon-link"></span></a>INSDC: International Nucleotide Sequence Database Collaboration</h1>

<p>INSDC members:</p>

<ul>
<li><strong>GenBank</strong></li>
<li>
<a href="http://www.ebi.ac.uk/ena/">ENA</a>: European Nucleotide Archive</li>
<li>
<a href="http://www.ddbj.nig.ac.jp/">DDBJ</a>: DNA Data Bank of Japan</li>
</ul><p>\ </p>

<p><a href="http://www.insdc.org/">http://www.insdc.org/</a></p>

<h1>
<a name="genbank-access" class="anchor" href="#genbank-access"><span class="octicon octicon-link"></span></a>GenBank Access</h1>

<p><a href="https://www.ncbi.nlm.nih.gov/genbank/">https://www.ncbi.nlm.nih.gov/genbank/</a></p>

<p>Primarily access via the NCBI <strong>Nucleotide</strong> database 
which is divided into three divisions: </p>

<ul>
<li>
<a href="https://www.ncbi.nlm.nih.gov/nuccore/">CoreNucleotide</a>: the main collection (same as Nucleotide) </li>
<li>
<a href="https://www.ncbi.nlm.nih.gov/nucest/">dbEST</a>: single-read transcript sequences (Expressed Sequence Tags)</li>
<li>
<a href="https://www.ncbi.nlm.nih.gov/nucgss/">dbGSS</a>: unannotated short single-read primarily genomic sequences</li>
</ul><p>But some other ways are available:</p>

<ul>
<li>BLAST: align against GenBank sequences</li>
<li>FPT</li>
</ul><h1>
<a name="genbank-record-format" class="anchor" href="#genbank-record-format"><span class="octicon octicon-link"></span></a>GenBank record format</h1>

<p>See an <a href="http://www.ncbi.nlm.nih.gov/Sitemap/samplerecord.html">Example of GenBank Record</a></p>

<h1>
<a name="refseq-the-reference-sequence-database-" class="anchor" href="#refseq-the-reference-sequence-database-"><span class="octicon octicon-link"></span></a>RefSeq: The Reference Sequence database </h1>

<p><a href="http://www.ncbi.nlm.nih.gov/refseq/">http://www.ncbi.nlm.nih.gov/refseq/</a></p>

<ul>
<li>a <strong>curated</strong> collection of DNA, RNA, and protein sequences</li>
<li>created by the NCBI from existing data (GeneBank)</li>
<li>unique example of each natural biological molecule (for each major organisms)</li>
<li>not all organisms available</li>
<li>for each model organism, RefSeq aims to provide separate and linked records for:

<ul>
<li>the genomic DNA</li>
<li>the gene transcripts</li>
<li>and the proteins arising from those transcripts</li>
</ul>
</li>
</ul><h1>
<a name="refseq" class="anchor" href="#refseq"><span class="octicon octicon-link"></span></a>RefSeq</h1>

<ul>
<li>non-redundant set of reference standards (<strong>NR</strong>)</li>
<li>
<p>includes:</p>

<ul>
<li>chromosomes</li>
<li>complete genomic molecules (organelle genomes, viruses, plasmids)</li>
<li>intermediate assembled genomic contigs</li>
<li>curated genomic regions, mRNAs, RNAs</li>
<li>proteins</li>
<li>alternatively spliced transcripts</li>
</ul>
</li>
<li><p>generated to provide reference standards for multiple purposes</p></li>
<li>
<p>facilitates database inquiries based on:</p>

<ul>
<li>genomic location</li>
<li>sequence</li>
<li>text annotation</li>
</ul>
</li>
</ul><h1>
<a name="refseq-access" class="anchor" href="#refseq-access"><span class="octicon octicon-link"></span></a>RefSeq Access</h1>

<ul>
<li>
<a href="http://www.ncbi.nlm.nih.gov/">Entrez</a>: <a href="http://www.ncbi.nlm.nih.gov/refseq/">http://www.ncbi.nlm.nih.gov/refseq/</a>
</li>
<li>
<a href="http://www.ncbi.nlm.nih.gov/gene">NCBI Gene</a>: include nomenclature, maps, pathways ...</li>
<li>
<a href="http://www.ncbi.nlm.nih.gov/genome/">NCBI Genome</a>: information on genomes including sequences, maps, chromosomes, assemblies, and annotations</li>
<li>
<a href="http://www.ncbi.nlm.nih.gov/assembly/">NCBI Assembly</a>: Genome assembly</li>
<li>
<a href="http://www.ncbi.nlm.nih.gov/unigene">NCBI UniGene</a>:  A Unified View of the Transcriptome</li>
</ul><p>\ </p>

<p>Example <a href="http://www.ncbi.nlm.nih.gov/genome/51">Homo sapiens (human)</a></p>

<h1>
<a name="refseq-record" class="anchor" href="#refseq-record"><span class="octicon octicon-link"></span></a>RefSeq record</h1>

<p>Each RefSeq record represents a synthesis, of the primary information that was generated and submitted by many researchers.</p>

<p>\ </p>

<p>Consistent framework between:</p>

<ul>
<li>sequence</li>
<li>genetic</li>
<li>expression</li>
<li>functional information</li>
<li>...</li>
</ul><p>\ </p>

<p>RefSeq records are similar in format to GenBank 
but may include a unique accession prefix followed by</p>

<h1>
<a name="refseq-accession-format" class="anchor" href="#refseq-accession-format"><span class="octicon octicon-link"></span></a>RefSeq Accession Format</h1>

<p>Accession format: accession number that begins with two characters followed by an underscore. </p>

<p>There are several <a href="http://www.ncbi.nlm.nih.gov/books/NBK21091/table/ch18.T.refseq_accession_numbers_and_mole/?report=objectonly">RefSeq accession prefixes</a></p>

<ul>
<li>NM_:  mRNA<br>
</li>
<li>NR_:  RNA (non coding)</li>
<li>NC_:  Complete genomic molecule, usually a reference assembly.</li>
</ul><p>Curation <strong>VERSION</strong> is indicated after a dot: </p>

<ul>
<li>NM_000014.4</li>
<li>NM_000014.5</li>
</ul><p>Usual fasta id for a sequence:</p>

<pre><code>&gt;gi|262118207|ref|NM_000202.5| Homo sapiens iduronate ...
</code></pre>

<p>Read about <a href="http://www.ncbi.nlm.nih.gov/nuccore/NM_002020.4?report=girevhist">GIs</a></p>

<h1>
<a name="refseq-curation-levels" class="anchor" href="#refseq-curation-levels"><span class="octicon octicon-link"></span></a>RefSeq Curation Levels</h1>

<p>There are several RefSeq curation levels. </p>

<p>See <a href="http://www.ncbi.nlm.nih.gov/books/NBK21091/table/ch18.T.refseq_status_codes/?report=objectonly">status codes here</a></p>

<p>RefSeq records with a status of <strong>VALIDATED</strong> or <strong>REVIEWED</strong> are intended to represent the current state of genomic knowledge.</p>

<h1>
<a name="ftp-downloads" class="anchor" href="#ftp-downloads"><span class="octicon octicon-link"></span></a>FTP Downloads</h1>

<p>See: <a>ftp://ftp.ncbi.nlm.nih.gov/refseq/</a></p>

<p>\ </p>

<p>Use shell command: <code>wget</code></p></article>
  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="http://developer.github.com">API</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>

    </ul>

    <a href="/">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2014 <span title="0.03416s from github-fe122-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
          <div class="suggester-container">
              <div class="suggester fullscreen-suggester js-navigation-container" id="fullscreen_suggester"
                 data-url="/ngscourse/ngscourse.github.io/suggestions/commit">
              </div>
          </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped leftwards" aria-label="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped leftwards"
      aria-label="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-remove-close close js-ajax-error-dismiss"></a>
      Something went wrong with that request. Please try again.
    </div>

  </body>
</html>

