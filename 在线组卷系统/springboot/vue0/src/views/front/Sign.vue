<template>
  <el-card style="margin: 10px 0">

    <el-table :data="tableData" stripe size="medium">
      <el-table-column label="考试名称">
        <template v-slot="scope">
          <span v-if="exams && exams.length">{{ exams.find(v => v.id === scope.row.examId) ? exams.find(v => v.id === scope.row.examId).name : '' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="考试状态">
        <template v-slot="scope">
          <span v-if="exams && exams.length">{{ exams.find(v => v.id === scope.row.examId) ? exams.find(v => v.id === scope.row.examId).state : '' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="学生">
        <template v-slot="scope">
          <span v-if="users && users.length">{{ users.find(v => v.id === scope.row.userId) ? users.find(v => v.id === scope.row.userId).nickname : '' }}</span>
        </template>
      </el-table-column>

      <el-table-column label="操作"  width="100" align="center">
        <template slot-scope="scope">
          <el-popconfirm
              v-if="scope.row.state === '未开始'"
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定取消报名吗？"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference">取消 <i class="el-icon-remove-outline"></i></el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>

    <el-dialog title="信息" :visible.sync="dialogFormVisible" width="30%" :close-on-click-modal="false">
      <el-form label-width="100px" size="small" style="width: 90%">
        <el-form-item label="考试id">
          <el-input v-model="form.examId" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="学生id">
          <el-input v-model="form.userId" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="审核状态">
          <el-input v-model="form.state" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </el-card>
</template>

<script>
export default {
  name: "Sign",
  data() {
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      name: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      exams: [],
      users: []
    }
  },
  created() {
    this.load()
  },
  methods: {
    changeState(row, state) {
      this.form = JSON.parse(JSON.stringify(row))
      this.form.state = state;
      this.save();
    },
    load() {
      this.request.get("/sign/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.name,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })

      this.request.get("/exam").then(res => {
        this.exams = res.data
      })

      this.request.get("/user").then(res => {
        this.users = res.data
      })
    },
    save() {
      this.request.post("/sign", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("操作成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
      this.$nextTick(() => {
        if(this.$refs.img) {
           this.$refs.img.clearFiles();
         }
         if(this.$refs.file) {
          this.$refs.file.clearFiles();
         }
      })
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
       this.$nextTick(() => {
         if(this.$refs.img) {
           this.$refs.img.clearFiles();
         }
         if(this.$refs.file) {
          this.$refs.file.clearFiles();
         }
       })
    },
    del(id) {
      this.request.delete("/sign/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    delBatch() {
      if (!this.multipleSelection.length) {
        this.$message.error("请选择需要删除的数据")
        return
      }
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/sign/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.name = ""
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    handleFileUploadSuccess(res) {
      this.form.file = res
    },
    handleImgUploadSuccess(res) {
      this.form.img = res
    },
    download(url) {
      window.open(url)
    },
    exp() {
      window.open("http://localhost:9090/sign/export")
    },
    handleExcelImportSuccess() {
      this.$message.success("导入成功")
      this.load()
    }
  }
}
</script>


<style>
.headerBg {
  background: #eee!important;
}
</style>
