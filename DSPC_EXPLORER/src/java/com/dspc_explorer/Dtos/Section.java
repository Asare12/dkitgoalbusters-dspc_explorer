package com.dspc_explorer.Dtos;
// Generated 07-Feb-2018 08:05:45 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Section generated by hbm2java
 */
@Entity
@Table(name="section"
    ,catalog="dspc_explorer"
)
public class Section  implements java.io.Serializable {


     private Integer sectionId;
     private String sectionCode;
     private Date dateOpened;
     private int graveCount;
     private Set<Graveowner> graveowners = new HashSet<Graveowner>(0);

    public Section() {
    }

	
    public Section(int graveCount) {
        this.graveCount = graveCount;
    }
    public Section(String sectionCode, Date dateOpened, int graveCount, Set<Graveowner> graveowners) {
       this.sectionCode = sectionCode;
       this.dateOpened = dateOpened;
       this.graveCount = graveCount;
       this.graveowners = graveowners;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="sectionId", unique=true, nullable=false)
    public Integer getSectionId() {
        return this.sectionId;
    }
    
    public void setSectionId(Integer sectionId) {
        this.sectionId = sectionId;
    }

    
    @Column(name="sectionCode", length=50)
    public String getSectionCode() {
        return this.sectionCode;
    }
    
    public void setSectionCode(String sectionCode) {
        this.sectionCode = sectionCode;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="dateOpened", length=10)
    public Date getDateOpened() {
        return this.dateOpened;
    }
    
    public void setDateOpened(Date dateOpened) {
        this.dateOpened = dateOpened;
    }

    
    @Column(name="graveCount", nullable=false)
    public int getGraveCount() {
        return this.graveCount;
    }
    
    public void setGraveCount(int graveCount) {
        this.graveCount = graveCount;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="section")
    public Set<Graveowner> getGraveowners() {
        return this.graveowners;
    }
    
    public void setGraveowners(Set<Graveowner> graveowners) {
        this.graveowners = graveowners;
    }




}


