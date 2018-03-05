<%@ page contentType="text/html; charset=UTF-8"%>

<style>
	.sidebar-menu {
		font-weight: bold;
	}
</style>

<aside class="main-sidebar">
	<section class="sidebar">
		<ul class="sidebar-menu">
			<li class="header"></li>
			<li id="ProjectInfo"><a href="ProjectInfo.do"><i class="glyphicon glyphicon-info-sign"></i> <span>프로젝트 정보</span></a></li>
			<li id="ProjectTool" class="treeview">
				<a href="#"><i class="glyphicon glyphicon-tasks"></i> 
					<span>프로젝트 도구</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i>
					</span> 
				</a>
				<ul class="treeview-menu">
					<li><a href="Kanban.do"> <span>- 칸반 보드</span></a></li>
					<li><a href="GanttList.do"> <span>- 간트 차트</span></a></li>
					<li><a href="ProjectCalendar.do"> <span>- 달력</span></a></li>
					<li><a href="mileStone.do"> <span>- Essence</span></a></li>
					<li><a href="KPT.do"> <span>- KPT</span></a></li>
				</ul>
			</li>
			<li id="FileShareMenu"><a href="FileShare.do?boardType=fileShare&pageNo=1"><i class="glyphicon glyphicon-cloud"></i> <span>파일공유</span></a></li>
			<li id="Version"><a href="ProjectBoard.do?boardType=version"><i class="glyphicon glyphicon-duplicate"></i> <span>형상관리</span></a></li>
			<li id="Meeting" class="treeview">
				<a href="#">
					<i class="glyphicon glyphicon-facetime-video"></i> 
					<span>화상회의 & 원격</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i>
					</span> 
				</a>
				<ul class="treeview-menu">
					<li><a href="MonitorShare.do"> <span>- 단체 화상회의 & 원격</span></a></li>
					<li><a href="Meeting.do"> <span>- 1:1 보안 화상회의</span></a></li>
				</ul>
			</li>
			<li id="Notice"><a href="ProjectBoard.do?boardType=notice&pageNo=1"><i class="glyphicon glyphicon-bullhorn"></i> <span>팀 공지사항</span></a></li>
			<li id="Board"><a href="ProjectBoard.do?boardType=board&pageNo=1"><i class="glyphicon glyphicon-list-alt"></i> <span>팀 게시판</span></a></li>
			<li id="ProjectMember"><a href="ProjectMember.do"><i class="glyphicon glyphicon-user"></i> <span>프로젝트 멤버</span></a></li>
			<li id="MyWork"><a href="CurrentWork.do?wpageNo=1&kpageNo=1"><i class="glyphicon glyphicon-pushpin"></i> <span>나의 작업</span></a></li>
		</ul>
	</section>
</aside>

