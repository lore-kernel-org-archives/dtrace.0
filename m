Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D747820628A
	for <dtrace@lists.linux.dev>; Fri,  6 Dec 2024 16:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733502844; cv=fail; b=ehrQO95XOFEltTJBw808JUlM12ONpA/OIqFU1BZpJfCM+AZ3e4p1vvL5+qQLn761O18RXTQ1adg6xsXwIlt8Hr+ipBAMUQFLy35BBMUuoFg7v3vYDFckE9crHUzKp54U8gO48vp/AwracjpoRvE7TDbLNZhM2ZA7LKCsYjdSnis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733502844; c=relaxed/simple;
	bh=8nkYvsjfAi+tDkT9s2PHAujMZGC3iNlIjf3BzMK69Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MzjS4Pttoldbs4l8cnutThCnXWZRJruehxcTSeX3dHJcMyuRbIQdLTrAvp1SRLmniYpUQMI4h3IxLXPYLgsaYQr4XiTS//nHPFKlCOrMifbDr35HFdgTaRLJ0/E+GgBgmZs5NaifHgZWGkasY1StXiRTirJWtNcnLLsPQUN/1f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q4pYeR3E; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yd3bIGOP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q4pYeR3E";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yd3bIGOP"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6FUDqg023110
	for <dtrace@lists.linux.dev>; Fri, 6 Dec 2024 16:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=fkwvQr1DysJkOikcKO
	mZnY4fjGtHds24uL2QuoPcmWk=; b=Q4pYeR3EPGdJ4rXr9ehzexQ2/SzKKrD9PC
	wvycgXlS1jsZiQ9AeibF1cKRfXziaeu8tC1C6GHLRsWeD+2xY7PwdwIaTNsnnQms
	Hnrgof349zQ9zZ875EWciBbhu2S+iE8iPjmX5uyVlOAbaC5h0/r/G2AQPyL6YtvB
	wmT427OOCSnX+bUkvPJO8/dh5r9MfPEBMOlH2/S1dXY9OyVv5OTz98mOwIoKY6g5
	AxFe1v1XiSYV/mqqWn+6Y5CyqeLnmFDVsH0KXHnmthHi5KC6q5uQzltBX5Ayf753
	TTmHkjGTuD/iVxTRhU0n8vnXV/rpUPqrdN6CBaVWoj0PI1RG/x9g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sg2ds5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Dec 2024 16:34:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6FFcqG040119
	for <dtrace@lists.linux.dev>; Fri, 6 Dec 2024 16:33:59 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836ydf5t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Dec 2024 16:33:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJlQI4/+Rh2aPtrBk9vtU+wDCc3GydVgITMKTgdd1n+OFFRvQAhYOJBhrqzMuoMuLusPD+yBk/0rIcl7cQd7KBmOtCyGtxSLDjsD6nJTiH8xuyZF6ikAvcd8xksTC0bmAyvvtW4aktout0nqmOZFUEfRHUTFFHItow9FP2WvCXNPFCrl26nr6uWA0Uh5dG/oJTrsJNOHFz3lRlaVd5Xa2+1PQvB8lUq4soxpsFzhCwwVRapPaKvSrQBEzZwfzKL+R/IqlC9XV9CfAWIzV4yruOh3jIxwg03Amssry8Qsq/9EA1g8Likb8A4IJBbipGW9SgMfyxf+uqT2NMgOKEIAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkwvQr1DysJkOikcKOmZnY4fjGtHds24uL2QuoPcmWk=;
 b=Y4WGI6EmNPlBBYrXWgbR/jZzNzyyI+Iu5Hay2QGcq8QjqrUgGk18wBXQ2abABoz7OypB7/5EgXL+cstVvJ0P+6T11OKY4EjEcoRRl1z2/Jik4+dLR9aG4n/VL1+XhtgbklKQkijBJQf81Ch2cKx8Ear5qubPxfpbItITU9/diVNOH3n991W+i+HkCAbTUOah2gvgMFNwZTDWur8+2WgzXoAC6anOwMwNpodI7bJsO+UnXNzJ8+3ETTONkXdoPtseEDE9qynBCoX+68puGRd5TaR3orDBW6rdGgBcQiWo9eOIpbnhELGkbW9fPHTG5nxi1CDhVqRPCSkaBgrOyrU0vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkwvQr1DysJkOikcKOmZnY4fjGtHds24uL2QuoPcmWk=;
 b=yd3bIGOPhjVTChmQLDt6hk/iZro27+8XXAnxHz3UOp6yUPIrgnO/9A7iFl+7icHJeZ13exFbt82j9ieYIFl+1SVqkjTfgOVxG48vZaYc57Vh+fKteqy67jn3CzrHtFZlF/orrwPBRJVMyuBv0QtTYoxqk4vKUSMwrVKPR35KFTA=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by DM6PR10MB4138.namprd10.prod.outlook.com (2603:10b6:5:218::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Fri, 6 Dec
 2024 16:33:55 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 16:33:55 +0000
Date: Fri, 6 Dec 2024 11:33:52 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] rawfbt: new provider
Message-ID: <Z1MncJ4JVhQBc3Kz@oracle.com>
References: <PH8SPRMB00374BF4E363FDE8B36D9E86C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
 <7b734e3f-2892-4282-9067-1b3ed69a8262@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b734e3f-2892-4282-9067-1b3ed69a8262@oracle.com>
X-ClientProxiedBy: BL1PR13CA0422.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::7) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|DM6PR10MB4138:EE_
X-MS-Office365-Filtering-Correlation-Id: 649396cd-b82d-474e-eb43-08dd1613c70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lTxRHnq1q46WcPZAaH/k4M/Wl2A8arIKw8mMlfUrUEylvAXMIvZkzay+Qu35?=
 =?us-ascii?Q?eQpcG2rPu8+s2U69GO+9u6bCE4hk7+TBXWRU0CzjzCVZ1JZRwlWsROEtUp25?=
 =?us-ascii?Q?RxC0fBllxLT3UHw761Zeox1CJaEbaK2nTuTbzs9QdMvkx2bnjwZMm/nhz7/p?=
 =?us-ascii?Q?49g80Vp3UxEy6VhzzRkx0C5oXbfsMZ3PNaGfemO+3YKCahLa+H570QguhO00?=
 =?us-ascii?Q?oq2Qp5j/UIwCqafju6QVsic87WGxlIapeyRlfVyTB1MK9fJJWCYHQpgPn+aM?=
 =?us-ascii?Q?X/voyGUhsG4L8NKuiM0kPTAADRv5t1/09qrhuz0WOYWHC0LBRuEWSeupt8y5?=
 =?us-ascii?Q?++If5hl5YBuJld3bym76BF0gP/WYpU0yBamrNHpV8cGI0wvYgnJQfsAT/tQz?=
 =?us-ascii?Q?cSPquqv9xpUhhuvaoRR7oDlTapPEox1ZoYChobkEYjiGScyPD29y0bRYPs7D?=
 =?us-ascii?Q?/BUBwKJ74NfFpS9gMe7VFMWre1HwsADsoatbnJrniRlIgwvrBmj62G4LB94t?=
 =?us-ascii?Q?pgyWBmeYPax9bdWRYR53clLwIBMBT7p2yqOPK3yy0q+cNTwd0BqX9G6K1OxH?=
 =?us-ascii?Q?n/8jlDxc17xoQ1pJeCn0Dq98+AratpCrq+SCiuDdVkKRqlYG1a1deESqERfa?=
 =?us-ascii?Q?oupN1lcJb41QnZwQzNbpmP9R3gwmIfpv5WywyzOF0ZiWVvTC5nc8uA/AwtRI?=
 =?us-ascii?Q?QTFYnOtBfVi78po4XuhdtTLePG8AOldyY0wxdMQ7GQR89FYKMSP+WyDZqKFh?=
 =?us-ascii?Q?xPkKhcBrUUOMv96UnSWcgdmiau3zWkZ0Ps6J57jIDKx9+Yt21InB1sI4i13X?=
 =?us-ascii?Q?6SWa5XnGGDNodw9CdTOA8DCGPNUeDxV7TZE8Pnkuc/7HaxbQ79ZUwpCsqydO?=
 =?us-ascii?Q?nGYDhJbxHx6RjhIJxoLrFGSej8E3lHlkZpAjfMpKGNVge6oC6oHIOZ6xy5Wr?=
 =?us-ascii?Q?Sg2dLbMzRG77JGjDdctsZ0TeVbVpxoA0TyG0DF6EKMDoWt2Qce23GaM3omUf?=
 =?us-ascii?Q?dwUfHFzsXBpHJqKQLjIGIKXtbkuZ1kzjgig5qB2IXO8N7o/wV4MJ9QrVxYVy?=
 =?us-ascii?Q?3S7yNKQQ0QvkdvDoOVGq6lrDXEBpk7q4NNKRSsMYDIrAGo1pernrPCwAM1yl?=
 =?us-ascii?Q?oo6crTWEA/rNDcwwF2qX9laBUiNPvsp1Sjad2QignI5m5Bg1evmI6Du6sDG6?=
 =?us-ascii?Q?QkqoAJtSbe3sy833e9kci0tgAzmWLT7xvHAl3dVTS3v51h/q1+ZyUn28tTEU?=
 =?us-ascii?Q?vn6gYEFbd8Gmfi8CctB1XB7AJoNIEJgfrUVIvmKIQ+Wrj6GFKzA6hjTy5rvy?=
 =?us-ascii?Q?PstdUBE0z/HAlEmt3pw3qgVgVFyppfXM2ZySOyV7zf4kTbzrdb3cVVl4MaxF?=
 =?us-ascii?Q?VSVaC/0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4TBPqE/60tuuG4ZroU5aEG/KAZO62JhG8aaMjXqJnJCqgT7cPy4u/IAK1wKa?=
 =?us-ascii?Q?Q+FEOAZ1kGQVyTxcQZSoOlAc5AZfgMdBZOIRqO5CR/MyTvy5qzuZpAO7divo?=
 =?us-ascii?Q?I7wKrt0Hw09kfqsxhSZRWtpRVnIHrITePvgjfv8lz03rhc3CKSb+9nL+N/uh?=
 =?us-ascii?Q?UbrSQ9G2b8Wzotbn9WSXhVI5f/ZfhpqvPZ8FrR/l0C1XWGgwDQyQKJBoM1sF?=
 =?us-ascii?Q?dpsy9XJxpUSj8jVEBwU1gMIWFOEayyONC5nscA3cUvyNPPwPWzQveBJQ7vSb?=
 =?us-ascii?Q?Ayj9YOcGhp2h9COUSMFNjiIu1kazzRsBUOsvaLAP6RK9oer9jicEO+FPMxBd?=
 =?us-ascii?Q?DJjj9Vv8bN70fg/gT5C5IeFM/aCB6+B/4YHlF9Io1yNrYAWSL5DP/IYK1ov5?=
 =?us-ascii?Q?GctRk3F21jnyjxDSmoKU20Pp9IXmz/8kMlv1YN9QhtRSPHHoKqgFeFweJ7NE?=
 =?us-ascii?Q?3z4Ux7KYi3o6Il0Ky3uCXU2sQ4pCrvFpngeJUn+lnCHUXa9SPCEkk6WBbtq2?=
 =?us-ascii?Q?kzsC9D9E+/ELGZ3qnAlZWy2CoaOdQWAULwKlL+2Ma1UM769PiOGz1rc/ZyVT?=
 =?us-ascii?Q?cLLZYcYa9SJQOppR3ch1aoNtsq7Xwx2Ono46rekSbwCs0Eb7jvm1FqmJL3fL?=
 =?us-ascii?Q?hvdqPKMo3nYHWAVkMaGE6pZgeF2LGsNxnaltoPDLXAeXJg2Vh2ORNStOeFBW?=
 =?us-ascii?Q?AJQW5MmPQvxr2B/g1cYnO2I/tm/0K66KbtgBjNGDdQ1CheBG4BF+lZlNeO69?=
 =?us-ascii?Q?cQ3RWXLI803M5wKitcdhrbTfMpmFub/adsxpd95G7vSysrjtcQfORbnB44Sb?=
 =?us-ascii?Q?8gX8zvBGlgZIh314GgpvyBQVVoNfWq7sjgfDmddnzPEsVF6U33VMPIUtlWeF?=
 =?us-ascii?Q?w6SLKXn5WaHTx+LsC2tRLb6bB191QBkGHG7sNkNhf9lMCCuvWW2oTa7/0bWr?=
 =?us-ascii?Q?K1+gkBE8/ooCHBkSFMDfxu6B8soHEtaVqg3bz1LMQxGDJgBDN5lxEwtMD/mm?=
 =?us-ascii?Q?QjObZGrqUNzLIowme71U1h5gc7pqZt1FO1a19TJKjm5nMooChLDk2jcPRsn0?=
 =?us-ascii?Q?Ga/ERyMAi73HeZvxkdYcSdMTolf7jk/jN6JhbD68I4IviXCA0mi7P6IvaZ23?=
 =?us-ascii?Q?AyxSjic0Zcf1q0dD9t+HDyhiSBp6E0u8k9mhD6MENbteS03PNTZ+c0fYgPi3?=
 =?us-ascii?Q?Ow2oQk0VGYUQTDGunwsy8WfDB/dUNhDmLPXhJ5wHrdsebc6FN6O9CK+PwD2M?=
 =?us-ascii?Q?WzyRoDRa7ekQmX1uJmvdy9opirw/UZG31yx+k6RW087y7Q1DK33Ju7tl0Lor?=
 =?us-ascii?Q?Xc8p0EjYcd+qXoC4nBkcy4zSJl5G1ytfn8gOSsDomj7a9GIL0hRFAlAJ4iKv?=
 =?us-ascii?Q?BEO5uMmBblhFkl/M7BfclpYo+8OE+cLsBmGaNG6e9mwPlM7WFwGg4VBp7Qr9?=
 =?us-ascii?Q?3W+oX6tyJXJyCWapl2C7GdwZKfYppUP6S923C581ag6zOxtQncwSP2H27bnN?=
 =?us-ascii?Q?VzDLl3BsnchH0/HSqxK5SRNEXl96Yoyx5J8Y8zn2MCLFOZ10IKPmBrQuKzpT?=
 =?us-ascii?Q?ZDQcDy36sljOWhmBsZtbrDtSNxOo0XIzbOYny2TjwXKzE1eDNkPoU72WQR5A?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E/jSqu/muW08ZLWlt1xvly7qmYVQpGGuYspyo4JZJPz9iqmQWdg54NQFqOwZd72FVTJ81VOURsZh/G+73h1W5hYhCZZr/2SEnVBRkl1o7lXf+xhNAGWzxWbwJwca5G1hXTvV1oKZ3ZUi1PwKhb/SmRYgMC6prduU0IYrn9b0ZpVBlE93027ATokQClfqOV9rdmbKkfX07UnE1Y4jaLnkClhcAm/VnXmFlHdv6vD2gHIbuZrjW9XOKfk2bvcaA6PZs3wUuqyuO7OyeifaY2VfPSK9Se4FMPZrnYeyjrcMvr5WYDqlzCyVXEdl6VIRDUYlOlBdVW2JwLU2izfMXN/4T3/6c1ojInsidLqEnSoZypBIqyaTL6fJQte5FbR31cj5SBltMC/gtVIzE/BdqVPXnUJ7JJKxv1ZVSG88rlH2pPlyBnMVKMgDYMjRZvVNheTFgJ38/+60lHKk2+9f3WwxZfQfbJKnV1ADO0s074XhG9y5wMNB3rEsnGMNvAu3ZTcH42dF1Ly1hJflDyJehteZwrybIFA3tgTF9AUzLdvuv581ZjkdxBxb5hP3PGxMmb173JF509mQeSE/bE5QAxEl+4FKMxRcsuH1souXm8dPJWw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 649396cd-b82d-474e-eb43-08dd1613c70d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 16:33:55.8024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODAfAYNZCTVDHIa487Mb0XtODfnunh8Arn1hSAjN7hdHsiAryveBsB1JP8B+p5f0gdIAjTwfHQA/NxfqxoluNt3VSeNbOzsuqhQ1xIumcNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4138
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_12,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412060125
X-Proofpoint-ORIG-GUID: jCqurn525YEFcO8-_SaZFrZxn5UQfeYL
X-Proofpoint-GUID: jCqurn525YEFcO8-_SaZFrZxn5UQfeYL

On Fri, Dec 06, 2024 at 10:35:50AM +0000, Alan Maguire wrote:
> On 05/12/2024 19:42, Kris Van Hees wrote:
> > This provider provides access to all kprobe-based probes that are
> > available on the system.  This includes any compiler-generated
> > optimized variants of functions, named <func>.<suffix>.
> > 
> 
> This is great! Having a rawfbt allows users to still trace cases
> where fprobe can't currently handle.
> 
> On the .suffix; I get that this is intended to be a raw provider, but
> would it be better for stability to expose these functions as "func"
> rather than "func.suffix"? It becomes difficult to write portable
> scripts when suffixes are included, because wildcarding
> 
> rawfbt::func*:entry
> 
> ...to catch both suffixed and non-suffixed variants may end up tracing
> func, func.suffix but also func2 etc.

The trouble is that exposing <func>.<suffix> as <func> will mean that you
automatically end up trying to probe *any* <func>.<suffix> whenever you
place a probe on <func> using rawfbt, which is not necessarily what you may
want.  And there would not be any way to avoid that.

But by not collapsing them, you have the ability to catch them all anyway,
if you want, by specifying <func>, <func>.* instead of <func>.

> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >  libdtrace/Build            |   2 +
> >  libdtrace/dt_prov_rawfbt.c | 330 +++++++++++++++++++++++++++++++++++++
> >  libdtrace/dt_provider.c    |   1 +
> >  libdtrace/dt_provider.h    |   1 +
> >  test/utils/clean_probes.sh |   2 +-
> >  5 files changed, 335 insertions(+), 1 deletion(-)
> >  create mode 100644 libdtrace/dt_prov_rawfbt.c
> > 
> > diff --git a/libdtrace/Build b/libdtrace/Build
> > index 8d398221..72235159 100644
> > --- a/libdtrace/Build
> > +++ b/libdtrace/Build
> > @@ -55,6 +55,7 @@ libdtrace-build_SOURCES = dt_aggregate.c \
> >  			  dt_prov_lockstat.c \
> >  			  dt_prov_proc.c \
> >  			  dt_prov_profile.c \
> > +			  dt_prov_rawfbt.c \
> >  			  dt_prov_rawtp.c \
> >  			  dt_prov_sched.c \
> >  			  dt_prov_sdt.c \
> > @@ -112,6 +113,7 @@ dt_prov_ip.c_CFLAGS := -Wno-pedantic
> >  dt_prov_lockstat.c_CFLAGS := -Wno-pedantic
> >  dt_prov_proc.c_CFLAGS := -Wno-pedantic
> >  dt_prov_profile.c_CFLAGS := -Wno-pedantic
> > +dt_prov_rawfbt.c_CFLAGS := -Wno-pedantic
> >  dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
> >  dt_prov_sched.c_CFLAGS := -Wno-pedantic
> >  dt_prov_sdt.c_CFLAGS := -Wno-pedantic
> > diff --git a/libdtrace/dt_prov_rawfbt.c b/libdtrace/dt_prov_rawfbt.c
> > new file mode 100644
> > index 00000000..edfd36b4
> > --- /dev/null
> > +++ b/libdtrace/dt_prov_rawfbt.c
> > @@ -0,0 +1,330 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + *
> > + * The Raw Function Boundary Tracing provider for DTrace.
> > + *
> > + * The kernel provides kprobes to trace specific symbols.  They are listed in
> > + * the TRACEFS/available_filter_functions file.  Kprobes may be associated with
> > + * a symbol in the core kernel or with a symbol in a specific kernel module.
> > + * Whereas the fbt provider supports tracing regular symbols only, the rawfbt
> > + * provider also provides access to synthetic symbols, i.e. symbols created by
> > + * compiler optimizations.
> > + *
> > + * Mapping from event name to DTrace probe name:
> > + *
> > + *	<name>					rawfbt:vmlinux:<name>:entry
> > + *						rawfbt:vmlinux:<name>:return
> > + *   or
> > + *	<name> [<modname>]			rawfbt:<modname>:<name>:entry
> > + *						rawfbt:<modname>:<name>:return
> > + */
> > +#include <assert.h>
> > +#include <errno.h>
> > +#include <fcntl.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <unistd.h>
> > +#include <linux/bpf.h>
> > +#include <linux/btf.h>
> > +#include <sys/stat.h>
> > +#include <sys/types.h>
> > +
> > +#include <bpf_asm.h>
> > +
> > +#include "dt_btf.h"
> > +#include "dt_dctx.h"
> > +#include "dt_cg.h"
> > +#include "dt_module.h"
> > +#include "dt_provider_tp.h"
> > +#include "dt_probe.h"
> > +#include "dt_pt_regs.h"
> > +
> > +static const char		prvname[] = "rawfbt";
> > +static const char		modname[] = "vmlinux";
> > +
> > +#define KPROBE_EVENTS		TRACEFS "kprobe_events"
> > +#define PROBE_LIST		TRACEFS "available_filter_functions"
> > +
> > +#define FBT_GROUP_FMT		GROUP_FMT "_%s"
> > +#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
> > +
> > +static const dtrace_pattr_t	pattr = {
> > +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
> > +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> > +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
> > +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
> > +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
> > +};
> > +
> > +/*
> > + * Scan the PROBE_LIST file and add entry and return probes for every function
> > + * that is listed.
> > + */
> > +static int populate(dtrace_hdl_t *dtp)
> > +{
> > +	dt_provider_t		*prv;
> > +	FILE			*f;
> > +	char			*buf = NULL;
> > +	size_t			len  = 0;
> > +	size_t			n = 0;
> > +	dtrace_syminfo_t	sip;
> > +	dtrace_probedesc_t	pd;
> > +
> > +	prv = dt_provider_create(dtp, prvname, &dt_rawfbt, &pattr, NULL);
> > +	if (prv == NULL)
> > +		return -1;			/* errno already set */
> > +
> > +	f = fopen(PROBE_LIST, "r");
> > +	if (f == NULL)
> > +		return 0;
> > +
> > +	while (getline(&buf, &len, f) >= 0) {
> > +		char		*p, *q;
> > +		const char	*mod = modname;
> > +		dt_probe_t	*prp;
> > +
> > +		/*
> > +		 * Here buf is either "funcname\n" or "funcname [modname]\n".
> > +		 * The last line may not have a linefeed.
> > +		 */
> > +		p = strchr(buf, '\n');
> > +		if (p) {
> > +			*p = '\0';
> > +			if (p > buf && *(--p) == ']')
> > +				*p = '\0';
> > +		}
> > +
> > +		/*
> > +		 * Now buf is either "funcname" or "funcname [modname".  If
> > +		 * there is no module name provided, we will use the default.
> > +		 */
> > +		p = strchr(buf, ' ');
> > +		if (p) {
> > +			*p++ = '\0';
> > +			if (*p == '[')
> > +				p++;
> > +		}
> > +
> > +#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
> > +		/* Weed out __ftrace_invalid_address___* entries. */
> > +		if (strstarts(buf, "__ftrace_invalid_address__") ||
> > +		    strstarts(buf, "__probestub_") ||
> > +		    strstarts(buf, "__traceiter_"))
> > +			continue;
> > +#undef strstarts
> > +
> > +		/*
> > +		 * If we did not see a module name, perform a symbol lookup to
> > +		 * try to determine the module name.
> > +		 */
> > +		if (!p) {
> > +			/*
> > +			 * For synthetic symbol names (those containing '.'),
> > +			 * we need to use the base name (before the '.') for
> > +			 * module name lookup, because the synthetic forms are
> > +			 * not recorded in kallsyms information.
> > +			 *
> > +			 * We replace the first '.' with a 0 to terminate the
> > +			 * string, and after the lookup, we put it back.
> > +			 */
> > +			q = strchr(buf, '.');
> > +			if (q != NULL)
> > +				*q = '\0';
> > +
> > +			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
> > +						  NULL, &sip) == 0)
> > +				mod = sip.object;
> > +
> > +			if (q != NULL)
> > +				*q = '.';
> > +		} else
> > +			mod = p;
> > +
> > +		/*
> > +		 * Due to the lack of module names in
> > +		 * TRACEFS/available_filter_functions, there are some duplicate
> > +		 * function names.  The kernel does not let us trace functions
> > +		 * that have duplicates, so we need to remove the existing one.
> > +		 */
> > +		pd.id = DTRACE_IDNONE;
> > +		pd.prv = prvname;
> > +		pd.mod = mod;
> > +		pd.fun = buf;
> > +		pd.prb = "entry";
> > +		prp = dt_probe_lookup(dtp, &pd);
> > +		if (prp != NULL) {
> > +			dt_probe_destroy(prp);
> > +			continue;
> > +		}
> > +
> > +		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
> > +			n++;
> > +		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
> > +			n++;
> > +	}
> > +
> > +	free(buf);
> > +	fclose(f);
> > +
> > +	return n;
> > +}
> > +
> > +/*
> > + * Generate a BPF trampoline for a FBT probe.
> > + *
> > + * The trampoline function is called when a FBT probe triggers, and it must
> > + * satisfy the following prototype:
> > + *
> > + *	int dt_fbt(dt_pt_regs *regs)
> > + *
> > + * The trampoline will populate a dt_dctx_t struct and then call the function
> > + * that implements the compiled D clause.  It returns 0 to the caller.
> > + */
> > +static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> > +{
> > +	dt_cg_tramp_prologue(pcb);
> > +
> > +	/*
> > +	 * After the dt_cg_tramp_prologue() call, we have:
> > +	 *				//     (%r7 = dctx->mst)
> > +	 *				//     (%r8 = dctx->ctx)
> > +	 */
> > +	dt_cg_tramp_copy_regs(pcb);
> > +	if (strcmp(pcb->pcb_probe->desc->prb, "return") == 0) {
> > +		dt_irlist_t	*dlp = &pcb->pcb_ir;
> > +
> > +		dt_cg_tramp_copy_rval_from_regs(pcb);
> > +
> > +		/*
> > +		 * fbt:::return arg0 should be the function offset for
> > +		 * return instruction.  Since we use kretprobes, however,
> > +		 * which do not fire until the function has returned to
> > +		 * its caller, information about the returning instruction
> > +		 * in the callee has been lost.
> > +		 *
> > +		 * Set arg0=-1 to indicate that we do not know the value.
> > +		 */
> > +		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, -1);
> > +		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> > +	} else
> > +		dt_cg_tramp_copy_args_from_regs(pcb, 1);
> > +	dt_cg_tramp_epilogue(pcb);
> > +
> > +	return 0;
> > +}
> > +
> > +static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> > +{
> > +	if (!dt_tp_probe_has_info(prp)) {
> > +		char	*fn, *prb, *p;
> > +		FILE	*f;
> > +		size_t	len;
> > +		int	fd, rc = -1;
> > +
> > +		/*
> > +		 * The tracepoint event we will be creating needs to have a
> > +		 * valid name.  We use a copy of the probe name, with . -> _
> > +		 * conversion.
> > +		 */
> > +		prb = strdup(prp->desc->fun);
> > +		for (p = prb; *p; p++) {
> > +			if (*p == '.')
> > +				*p = '_';
> > +		}
> > +
> > +		/*
> > +		 * Register the kprobe with the tracing subsystem.  This will
> > +		 * create a tracepoint event.
> > +		 */
> > +		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> > +		if (fd == -1)
> > +			return -ENOENT;
> > +
> > +		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
> > +			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
> > +			     FBT_GROUP_DATA, prb, prp->desc->fun);
> > +		close(fd);
> > +		if (rc == -1)
> > +			return -ENOENT;
> > +
> > +		/* create format file name */
> > +		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
> > +			       EVENTSFS, FBT_GROUP_DATA, prb) + 1;
> > +		fn = dt_alloc(dtp, len);
> > +		if (fn == NULL)
> > +			return -ENOENT;
> > +
> > +		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
> > +			 FBT_GROUP_DATA, prb);
> > +
> > +		/* open format file */
> > +		f = fopen(fn, "r");
> > +		dt_free(dtp, fn);
> > +		if (f == NULL)
> > +			return -ENOENT;
> > +
> > +		/* read event id from format file */
> > +		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
> > +		fclose(f);
> > +
> > +		if (rc < 0)
> > +			return -ENOENT;
> > +	}
> > +
> > +	/* attach BPF program to the probe */
> > +	return dt_tp_probe_attach(dtp, prp, bpf_fd);
> > +}
> > +
> > +static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp, int *argcp,
> > +		      dt_argdesc_t **argvp)
> > +{
> > +	*argcp = 0;			/* no arguments by default */
> > +	*argvp = NULL;
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Try to clean up system resources that may have been allocated for this
> > + * probe.
> > + *
> > + * If there is an event FD, we close it.
> > + *
> > + * We also try to remove any kprobe that may have been created for the probe.
> > + * This is harmless for probes that didn't get created.  If the removal fails
> > + * for some reason we are out of luck - fortunately it is not harmful to the
> > + * system as a whole.
> > + */
> > +static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> > +{
> > +	int	fd;
> > +
> > +	if (!dt_tp_probe_has_info(prp))
> > +		return;
> > +
> > +	dt_tp_probe_detach(dtp, prp);
> > +
> > +	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> > +	if (fd == -1)
> > +		return;
> > +
> > +	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA,
> > +		prp->desc->fun);
> > +	close(fd);
> > +}
> > +
> > +dt_provimpl_t	dt_rawfbt = {
> > +	.name		= "rawfbt",
> > +	.prog_type	= BPF_PROG_TYPE_KPROBE,
> > +	.populate	= &populate,
> > +	.load_prog	= &dt_bpf_prog_load,
> > +	.trampoline	= &trampoline,
> > +	.attach		= &attach,
> > +	.probe_info	= &probe_info,
> > +	.detach		= &detach,
> > +	.probe_destroy	= &dt_tp_probe_destroy,
> > +};
> > diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> > index 1e2e844e..0c621197 100644
> > --- a/libdtrace/dt_provider.c
> > +++ b/libdtrace/dt_provider.c
> > @@ -36,6 +36,7 @@ const dt_provimpl_t *dt_providers[] = {
> >  	&dt_lockstat,
> >  	&dt_proc,
> >  	&dt_profile,
> > +	&dt_rawfbt,
> >  	&dt_rawtp,
> >  	&dt_sched,
> >  	&dt_sdt,
> > diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> > index f62137de..59a8d62e 100644
> > --- a/libdtrace/dt_provider.h
> > +++ b/libdtrace/dt_provider.h
> > @@ -82,6 +82,7 @@ extern dt_provimpl_t dt_ip;
> >  extern dt_provimpl_t dt_lockstat;
> >  extern dt_provimpl_t dt_proc;
> >  extern dt_provimpl_t dt_profile;
> > +extern dt_provimpl_t dt_rawfbt;
> >  extern dt_provimpl_t dt_rawtp;
> >  extern dt_provimpl_t dt_sched;
> >  extern dt_provimpl_t dt_sdt;
> > diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
> > index 8292b309..16052cbc 100755
> > --- a/test/utils/clean_probes.sh
> > +++ b/test/utils/clean_probes.sh
> > @@ -70,7 +70,7 @@ fi
> >  	     { sub(/:/, "/"); }
> >  
> >  	     {
> > -		 if (/_fbt_/)
> > +		 if (/_(raw)?fbt_/)
> >  		     kpv[kpc++] = $0;
> >  		 else
> >  		     upv[upc++] = $0;
