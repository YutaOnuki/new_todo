<template>
  <div class="container">
    <!-- タスク追加フォーム -->
    <div class="columns">
      <div class="column is-10">
        <div class="control has-icons-left">
          <input v-model="newTask" class="input is-rounded is-info" type="text" placeholder="Add your plans!!">
          <span class="icon is-right">
            <i class="fas fa-pencil-alt"></i>
          </span>
        </div>
      </div>
      <div v-on:click="createTask" class="column is-2">
        <a class="button is-rounded is-info">Add Task!</a>
      </div>
    </div>

    <!-- タスク一覧 -->
    <div class="panel">
      <p class="panel-heading is-info">
        Your Tasks
      </p>
      <div id="'task_' + task.id" v-for="task in checkIncompletedTasks" :key="task.id" class="panel-block">
        <label class="checkbox">
          <input v-on:click="doneTask(task.id)" type="checkbox">
            {{ task.name }}
        </label>
      </div>
    </div>

    <!-- 完了タスク表示ボタン -->
    <div>
      <button v-on:click="displayCompleteTasks" class="button is-info is-fullwidth is-focused is-rounded finished-button">
        Show Finished Tasks
      </button>
    </div>

    <!-- 完了タスク一覧 -->
    <div id="finishedTasks" class="panel display-none">
      <label v-for="task in CompleteTasks" :key="task.id" class="panel-block">
        <span class="icon has-text-success">
          <i class="far fa-check-circle"></i>
        </span>
        <p class="line-through">
          {{ task.name }}
        </p>
      </label>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

axios.defaults.headers.common = {
  'X-Requested-With': 'XMLHttpRequest',
  'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
}

export default {
  data: function () {
    return {
      tasks: [],
      newTask: ''
    }
  },
  mounted () {
    const self = this
    axios.get('/api/tasks').then(function (response) {
      response.data.task.forEach(function (task) {
        self.tasks.push(task)
      })
    })
  },
  computed: {
    checkIncompletedTasks: function () {
      return this.tasks.filter(function (task) {
        return !task.is_done
      })
    },
    CompleteTasks: function () {
      return this.tasks.filter(function (task) {
        return task.is_done
      })
    }
  },
  methods: {
    createTask: function () {
      if (!this.newTask) return

      axios.post('/api/tasks', { task: { name: this.newTask } }).then((response) => {
        this.tasks.unshift(response.data.task)
        this.newTask = ''
      }, (error) => {
        console.log(error)
      })
    },
    doneTask: function (taskId) {
      axios.put('/api/tasks/' + taskId, { task: { is_done: 1 } }).then((response) => {
        var index = this.tasks.findIndex(function (element) {
          return element.id === taskId
        })
        this.$set(this.tasks[index], 'is_done', true)
      }, (error) => {
        console.log(error)
      })
    },
    displayCompleteTasks: function () {
      var doneTasks = this.tasks.filter(function (task) {
        return task.is_done
      })
      if (doneTasks.length > 0) {
        document.querySelector('#finishedTasks').style.display = 'block'
      }
    }
  }
}
</script>

<style>
   [v-cloak] {
    display: none;
  }

  .display-none {
    display: none;
  }

  .line-through {
    text-decoration: line-through;
  }

  .panel-heading {
    background-color: hsl(204, 86%, 53%);
    color: hsl(0, 0%, 100%);
  }

  .finished-button {
    margin-bottom: 30px;
  }
</style>
