
// 上下文路径
let baseUrl;

// 初始化参数
function initPager(b) {
	baseUrl = b;
}

// 获取每页显示数量
let pageSize = $('#paging #pageSizeSelect').val();

// 页码
let pageNum = 1;

$('#paging #pageSizeSelect').change(function() {

	pageSize = $(this).val();

	location.href = baseUrl + "&pageSize=" + pageSize;

});

$('#paging a').click(function() {

	pageNum = $(this).data('page');

	location.href = baseUrl + "&pageNum=" + pageNum + "&pageSize=" + pageSize;
});
