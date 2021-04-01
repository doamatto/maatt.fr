import Image from 'next/image'

const styles = require('./item.module.scss')

export default function Item ({ title, titleUrl, description, imageId, url }: {
  title: string
  titleUrl?: string // optional
  imageId?: string // optional
  description: string
  url: string
}) {
  return (
    <section className="border border-gray-200 dark:border-gray-800 roudned p-4 max-w-72 w-full">
      <a href={url} title={title}>
        <Icon title={title} imageId={imageId} />
        <div className={styles.text}>
          <TitleGen title={title} titleUrl={titleUrl} />
          <p className="my-1">{description}</p>
        </div>
      </a>
    </section>
  )
}

function Icon ({ title, imageId }: {title:string, imageId: string}) {
  if (imageId !== undefined) {
    return (
        <img
          src={`/assets/uses/${imageId}.png`}
          alt={title}
          width={64}
          height={64}
          className="max-w-16 max-w-16"
        />
    )
  }
  return null
}

function TitleGen ({ title, titleUrl }:{title:string, titleUrl:string}) {
  if (titleUrl !== undefined) {
    return (
    <a href={titleUrl} title={title}>
        <h3 className={styles.itemTitle}>{title}</h3>
    </a>
    )
  }
  return (
    <h3 className={styles.itemTitle}>{title}</h3>
  )
}
