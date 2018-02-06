# Based on:
# - https://github.com/cobyism/ubersicht-memory-bar
# - https://github.com/PerishableDave/ubersicht-cpu-bar
# - https://github.com/dionmunk/ubersicht-network-throughput

# Command to execute:
command: "#{process.argv[0]} bar/commands/update"

# In ms:
refreshFrequency: 1000

style: """
  -webkit-box-sizing border-box
  -webkit-font-smoothing grayscale

  display flex
  align-items center
  justify-content space-between

  width 100%
  height 22px
  padding 0 1rem

  color white
  font-size 14px
  font-family -apple-system, BlinkMacSystemFont

  div
    display inline-block

    height 20spx
    line-height 20px

    margin 0 .75rem

  .center
    position absolute
    left 50%
    transform translateX(-50%)

  .center,
  .right
    font-size 12px
    font-weight 300
    color #d2ceff

  .fa-battery-empty
    color: #ec6093

  .icon
    font-size: 16px
    vertical-align middle
    margin-right .5rem

  #focused,
  #chunkwm
    font-weight bold
"""

render: (output) ->
  """
    <link rel="stylesheet" href="bar/assets/font-awesome/css/font-awesome.min.css" />

    <section class="left">
      <div class="icon fa fa-apple"></div>
      <div id="focused"></div>
      <div id="chunkwm"></div>
    </section>

    <section class="center">
      <div id="time"></div>
    </section>

    <section class="right">
      <div>
        <span id="net_up"></span> |
        <span id="net_down"></span>
      </div>

      <div>MEM <span id="mem"></span></div>
      <div>CPU <span id="cpu"></span></div>
      <div id="date"></div>

      <div>
        <span id="battery_icon"></span>
        <span id="battery_stat"></span>
      </div>
    </section>
  """

update: (output, el) ->
  data = JSON.parse(output)

  @updateNET(data.net, el)
  @updateMEM(data.mem, el)
  @updateCPU(data.cpu, el)
  @updateTime(data.time, el)
  @updateDate(data.date, el)
  @updateFocused(data.focused, el)
  @updateBattery(data.battery, el)
  # @updateChunkwm(data.chunkwm, el)

updateCPU: (data, el) ->
  $("#cpu", el).text("#{parseInt(data.user + data.sys)}%")

updateMEM: (data, el) ->
  $("#mem", el).text(@memoryUsage(data.free + data.inactive))

updateNET: (data, el) ->
  $("#net_up", el).text(@networkUsage(data.up))
  $("#net_down", el).text(@networkUsage(data.down))

updateFocused: (data, el) ->
  $("#focused", el).text(data)

updateDate: (data, el) ->
  $("#date", el).text(data)

updateTime: (data, el) ->
  $("#time", el).text(data)

updateChunkwm: (data, el) ->
  $("#chunkwm", el).text(data)

updateBattery: (battery, el) ->
  $("#battery_stat", el).text("#{battery}%")
  $("#battery_icon", el).removeClass().addClass("icon fa #{@batteryIcon(battery)}")

batteryIcon: (percentage) =>
  if percentage > 90 then return "fa-battery-full"
  if percentage > 70 then return "fa-battery-three-quarters"
  if percentage > 40 then return "fa-battery-half"
  if percentage > 20 then return "fa-battery-quarter"
  "fa-battery-empty"

memoryUsage:  (bytes) -> @memoryUsageFormat((bytes * 4096) / 1024 / 1024)
networkUsage: (bytes) -> @networkUsageFormat(bytes / 1024)

memoryUsageFormat: (mb) ->
  if mb > 1024 then "#{parseFloat((mb / 1024).toFixed(2))}GB"
  else "#{parseFloat(mb.toFixed(2))}MB"

networkUsageFormat: (kb) ->
    if kb > 1024 then "#{parseFloat((kb / 1024).toFixed(2))} MB/s"
    else"#{parseFloat(kb.toFixed(2))} KB/s"
