import { parseISO, format } from 'date-fns'

export function Timeline ({components, ...props}) {
  return (
    <section id="timeline">
      <h2>Timeline</h2>
      {props.children}
    </section>
  )
}

export function parse(date:string) {
  if(date==='now') return "now"
  return format(parseISO(date), 'MMMM dd, yyyy')
}

export function Item ({components, ...props}) {
  return (
    <section className={props.status + " border-l-4 pl-2"}>
      {props.title && ( <h3 className="font-bold text-xl">{props.title}</h3> )}
      {props?.children}
      {props.date && (
        <h4 className="text-sm m-0 font-bold opacity-70">{parse(props.date)}</h4>
      )}
      {props.dateRange && (
        <h4 className="text-sm m-0 font-bold opacity-70">{parse(props.dateRange[0])} to {props.dateRange[1] === "now" ? (
          parse('now')
        ) : (
          parse(props.dateRange[1])
        ) }</h4>
      )}
      {!props.date && !props.dateRange && (
        <h4 className="text-sm m-0 font-bold opacity-70">Unknown time period</h4>
      )}
    </section>
  )
}

Item.isMDXComponent = true
Timeline.isMDXComponent = true