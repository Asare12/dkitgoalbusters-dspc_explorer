package com.dspc_explorer.Dtos;
// Generated 07-Feb-2018 08:05:45 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Graveowner generated by hbm2java
 */
@Entity
@Table(name="graveowner"
    ,catalog="dspc_explorer"
)
public class Graveowner  implements java.io.Serializable {


     private int graveId;
     private Section section;
     private String graveRefCode;
     private String graveOwnerName;
     private String graveOwnerAddress;
     private Date graveopenDate;
     private int graveRow;
     private int graveDepth;
     private String graveLocation;
     private byte[] graveImage;
     private Set<Registrar> registrars = new HashSet<Registrar>(0);

    public Graveowner() {
    }

	
    public Graveowner(int graveId, Section section, int graveRow, int graveDepth) {
        this.graveId = graveId;
        this.section = section;
        this.graveRow = graveRow;
        this.graveDepth = graveDepth;
    }
    public Graveowner(int graveId, Section section, String graveRefCode, String graveOwnerName, String graveOwnerAddress, Date graveopenDate, int graveRow, int graveDepth, String graveLocation, byte[] graveImage, Set<Registrar> registrars) {
       this.graveId = graveId;
       this.section = section;
       this.graveRefCode = graveRefCode;
       this.graveOwnerName = graveOwnerName;
       this.graveOwnerAddress = graveOwnerAddress;
       this.graveopenDate = graveopenDate;
       this.graveRow = graveRow;
       this.graveDepth = graveDepth;
       this.graveLocation = graveLocation;
       this.graveImage = graveImage;
       this.registrars = registrars;
    }
   
     @Id 

    
    @Column(name="grave_id", unique=true, nullable=false)
    public int getGraveId() {
        return this.graveId;
    }
    
    public void setGraveId(int graveId) {
        this.graveId = graveId;
    }

@ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="sectionId", nullable=false)
    public Section getSection() {
        return this.section;
    }
    
    public void setSection(Section section) {
        this.section = section;
    }

    
    @Column(name="grave_ref_code", length=50)
    public String getGraveRefCode() {
        return this.graveRefCode;
    }
    
    public void setGraveRefCode(String graveRefCode) {
        this.graveRefCode = graveRefCode;
    }

    
    @Column(name="grave_owner_name", length=100)
    public String getGraveOwnerName() {
        return this.graveOwnerName;
    }
    
    public void setGraveOwnerName(String graveOwnerName) {
        this.graveOwnerName = graveOwnerName;
    }

    
    @Column(name="grave_owner_address", length=150)
    public String getGraveOwnerAddress() {
        return this.graveOwnerAddress;
    }
    
    public void setGraveOwnerAddress(String graveOwnerAddress) {
        this.graveOwnerAddress = graveOwnerAddress;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="graveopen_date", length=10)
    public Date getGraveopenDate() {
        return this.graveopenDate;
    }
    
    public void setGraveopenDate(Date graveopenDate) {
        this.graveopenDate = graveopenDate;
    }

    
    @Column(name="grave_row", nullable=false)
    public int getGraveRow() {
        return this.graveRow;
    }
    
    public void setGraveRow(int graveRow) {
        this.graveRow = graveRow;
    }

    
    @Column(name="grave_depth", nullable=false)
    public int getGraveDepth() {
        return this.graveDepth;
    }
    
    public void setGraveDepth(int graveDepth) {
        this.graveDepth = graveDepth;
    }

    
    @Column(name="grave_location", length=100)
    public String getGraveLocation() {
        return this.graveLocation;
    }
    
    public void setGraveLocation(String graveLocation) {
        this.graveLocation = graveLocation;
    }

    
    @Column(name="grave_image")
    public byte[] getGraveImage() {
        return this.graveImage;
    }
    
    public void setGraveImage(byte[] graveImage) {
        this.graveImage = graveImage;
    }

@OneToMany(fetch=FetchType.EAGER, mappedBy="graveowner")
    public Set<Registrar> getRegistrars() {
        return this.registrars;
    }
    
    public void setRegistrars(Set<Registrar> registrars) {
        this.registrars = registrars;
    }

    



}


