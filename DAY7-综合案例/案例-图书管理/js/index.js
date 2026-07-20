//--------------------------1. 查询图书列表---------------------------
let loginUser = 'itheima2'  //登录成功的用户名，默认itheima
//1 定义方法，查询图书列表
function queryBookList() {
  //2 在方法中使用axios从服务器获取图书列表数据
  axios.get(`https://hmajax.itheima.net/api/books?creator=${loginUser}`).then((result) => {
    //3 获取将服务器响应回来的图书列表数据
    let bookList= result.data.data
    //4 遍历图书数据，拼接每一行的html代码
    let trs = ``;
    for (let i= 0; i< bookList.length; i++) {
      let book = bookList[i]; //获取每一本书(对象)
      //有多少本书就平均多个tr行
      trs += `<tr>
                    <td>${i+1}</td>
                    <td>${book.bookname}</td>
                    <td>${book.author}</td>
                    <td>${book.publisher}</td>
                    <td>
                        <button type="button" class="btn btn-outline-warning btn-sm" onclick='delBook(${book.id})'>删除</button>
             <button type="button" class="btn btn-outline-primary btn-sm" onclick='findBook(${book.id})'>编辑</button>
                    </td>
                </tr>`
    }
    //5 将拼接好的html代码设置到表格中
    document.querySelector('.list').innerHTML = trs
  });
}
//6 定义完方法之后就调用方法，页面加载成功就查询所有图书
queryBookList()

//--------------------------2. 新增图书---------------------------
//2.1 显示新增对话框(模态框)-------------
// 1. 获取新增弹出框元素对象，创建模态框对象--->去bootstrap模态框中找
let addModelDiv = document.querySelector('.add-modal');  //获取div对象
let addModel = new bootstrap.Modal(addModelDiv, {})  //将div对象交给bootstrap的Modal方法，创建模态框(弹出框)对象
// 2. 给右上角"添加"按钮绑定click单击事件
document.querySelector('.plus-btn').addEventListener('click', () => {
  // 3. 在事件函数中显示新增对话框(模态框)--->去bootstrap模态框中找
  addModel.show()
   // 4. 清空表单中的数据
  document.querySelector('.add-modal .bookname').value = '';
  document.querySelector('.add-modal .author').value = '';
  document.querySelector('.add-modal .publisher').value = '';
})


//2.2 保存新图书-----------------------
// 1. 给保存按钮绑定点击事件
document.querySelector(`.add-btn`).addEventListener('click',()=>{

  // 2. 在事件函数中获取用户输入的图书数据
 let bookname = document.querySelector('.add-modal .bookname').value;
  let author = document.querySelector('.add-modal .author').value;
  let publisher = document.querySelector('.add-modal .publisher').value;

 // 3. 判断输入框内容非空，如果为空则不保存
    if(bookname == '' || author == '' || publisher == ''){
      alert('请输入完整图书信息');
      return
    }
    let data = {
      bookname,
      author,
      publisher,
      creator: loginUser //登录成功的用户名，默认itheima
    }
     // 4. 使用axios将图书数据提交给服务器
    axios.post(`https://hmajax.itheima.net/api/books`,data).then((result) => {
      // 5. 处理服务器返回的结果：重新查询所有图书，隐藏弹出框
      //重新查询所有图书
      queryBookList();
      //隐藏弹出框 addModel.hide();
      addModel.hide();
    })
})
    
//--------------------------3. 删除图书---------------------------
// 1 给"删除"按钮绑定单击事件
  function delBook(id){
// console.log('删除图书', id);
// 2. 提示用户是否确认删除图书
let isDel = confirm('确认删除吗？');//点击确定返回true，点击取消返回false
if(isDel){
  // 3. 使用axios发送请求，根据图书id删除图书
  axios.delete(`https://hmajax.itheima.net/api/books/${id}`).then((result) => {
    // 4. 处理服务器返回的数据：重新加载图书列表
    queryBookList();
  }).catch((err) => {
    alert(err.response.data.message);
  });
}
}


//--------------------------4. 编辑图书---------------------------
//4.1 回显图书信息---------------------
//2. 获取编辑弹出框元素对象，创建模态框对象--->去bootstrap模态框中找
let editModelDiv = document.querySelector('.edit-modal');  //获取div对象
let editModel = new bootstrap.Modal(editModelDiv, {})  //将div对象交给bootstrap的Modal方法，创建模态框(弹出框)对象
// 1. 给"编辑"按钮绑定单击事件
function findBook(id){
  // console.log('编辑图书', id);
  // 3. 在事件函数中，显示编辑图书的弹框
  editModel.show()
   // 4. 使用axios发送请求，根据图书id获取图书详情数据
   axios.get(`https://hmajax.itheima.net/api/books/${id}`).then((result) => {
    // 5. 处理服务器返回的数据：将图书详情数据回显到编辑弹框中
    //5.1 获取图书数据
    let book = result.data.data;
    document.querySelector('.edit-modal .bookname').value = book.bookname;
    document.querySelector('.edit-modal .author').value = book.author;
    document.querySelector('.edit-modal .publisher').value = book.publisher;  
    document.querySelector('.edit-modal .id').value = book.id;
  })
}

//4.2 保存图书信息，用户修改完毕点击修改按钮, 将最新的数据发送给服务器------------
// 1. 给"弹出框"中的修改按钮绑定单击事件
document.querySelector('.edit-btn').addEventListener('click', () => {
  // 2. 获取用户输入的数据(修改后的表单数据)
  let bookname = document.querySelector('.edit-modal .bookname').value;
  let author = document.querySelector('.edit-modal .author').value;
  let publisher = document.querySelector('.edit-modal .publisher').value;
  let id = document.querySelector('.edit-modal .id').value;
  // 3. 校验非空，如果为空就提示错误信息
  if (!bookname || !author || !publisher) {
    alert('请输入完整图书信息');
    return;
  }
  // 4. 使用axios发送请求，将修改后的数据发送给服务器
  let data = { bookname, author, publisher, creator: loginUser }
  axios.put('https://hmajax.itheima.net/api/books/' + id, data).then(result => {
    // 5. 处理服务器的返回结果：隐藏编辑弹框， 重新加载数据
    //隐藏编辑弹框
    editModel.hide();
    //重新加载数据
    queryBookList();
  })
})