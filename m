Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8AD1A0B16
	for <dtrace@lists.linux.dev>; Fri,  1 Nov 2024 15:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730476653; cv=fail; b=Gn2Roj/PgLkmDlXjAbl6mMXBMmY4Ay6OvD314KiunLFrBGAfj1XAAHdkKO1rPOKj58FHgg1zQgKgnfQzqYlBcycgE5p23hB+T9xcx1ArirY3EoBkm7VJQraepnSwQaTlTppajura/EYZKk5jRon0i2GQTc0okIfR9cVVQxLJ36s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730476653; c=relaxed/simple;
	bh=2CIdcoXRnYxyWGUbaFj9cNfbF2cMx0GKvo8hl1XEHCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ofbYa4WNGi8EcpdBY2T7DMz4nLcmjyv07ac03VjyqPQRHuPPkheyBThhZsQZzkhXeqSCndjdNAS8vNHOxrglFXmBH47qrdZQZpFhxclgqeJHatyIF3yHeTZnsfTwauMc3sNI35k2WGC9Zw5mIupLorEQYH0JsqsAj3O4o62UNYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ncRgerqj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=N7u34cuu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ncRgerqj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="N7u34cuu"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1EuEx0018893
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=; b=
	ncRgerqjjwcXXtoWY1ZCYhss9hhozdjjUOxA8mXypeYTlgPtDtIkHiKNCuYXZeWR
	TyFmt8btxobYlm4xzcGdB8I2AF5FXY1/bjmw0jTaH/g3tAxNWzZVjDANWvwHBvPz
	KMVm2CRd3sWB9kuCW/Ho4ki1B71AwNsW5JDozHvqTtVy4zG97yLINVhUixoIA5Xp
	toTSuBb/6KZcwJz0nZayF2Cj7zgNFvsdzJB8BjFVCVFM271sQnuKXyGRai97jPIH
	wPp9iOXc0k8ODqu+QmfLl068Dnlf2E/p7nVsa6KXN6tTUs+mycQn4MVUBtWkfm6R
	zDqj1ggfUh9QSRVX1wTRuQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmmpdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:57:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1Er2Yi009960
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:57:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hn91u1aj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:57:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aq8jILYuMM4+Kpa8phEu5yLHxioUcdpiiDWJuh/Giip4Py8p6hE52kEb99CKf39KLNN3RRxw+GCAJ3Dmz6fmKfwJeWzywCpey+lvK3jdvyah+i4PXxKcCkHyArdwwn6pg6+I1BOEJSg6977eJtd59rFhIw6DBFnMOqnhtCKQs0pwEZknMmrULmDt3y6zNAgi2Cn1XmXB4jG+nEzBZKf/tdLdEtd5bMxnmU8PCYLpTHExYYF5hVkK1kWS/nWVtbT4aS24mIcJ/7RORSQoFT9dsWbjO3CFojq+OzwUWdhXpc53MByQRSqWxR9Ld0KKGX9WA3MzUxga8bXXkxI/y7ud1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=;
 b=BDCkd6/iF7M6TjH7JQruxzIl8qpEWvGnbeNOOX0I52DH8GAe2S1xVyO9SWNqC/BldbR1Vg6hhiX1dhldPZy+7NXnkklrkPErbzJ+s8GUx83RPgagdEf500vb09u4J57P/gu1bNc4HzNQ/RcwE06UwnMTwrT4yGCqAOBFnqUXZH03KefMjCoSA3KAyCbapmVhC+6UFawLBpilsOf+8NZ5jfZ7dJIS+Iaxp+Df5KFlAqlfkRysSkBf38qR1Dgd6mM/hKnp1VUk7Cxarcxus/CcbVmLnkB+wmFUfT1LobJv9iB+DiSxYRJvBx8LUx8Ketv441Ojwsj18nOoiwn559ODpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=;
 b=N7u34cuu3WIoMBHy1Qw3n/x2/cZfHjULxitowqp+SeiPdWB0gqbhkdnEq5+0JKyWnuQjgF5dBEV5AFB2q59Wq2wtCdRnnkzC8fbg0xotgYnz/7Szx2XbwV+Q/BEVwb1Ix0As5FY+f+cMgkUjF7HJicSmksAmX7xsw36xJGuq7rg=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MW4PR10MB5810.namprd10.prod.outlook.com (2603:10b6:303:186::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Fri, 1 Nov
 2024 15:57:25 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 15:57:25 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v4 2/5] dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
Date: Fri,  1 Nov 2024 15:57:09 +0000
Message-ID: <20241101155712.397674-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241101155712.397674-1-nick.alcock@oracle.com>
References: <20241101155712.397674-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0585.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::19) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MW4PR10MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: b20c4c72-bab0-4b89-1adc-08dcfa8de108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hqowl6SKpUgKheb/R8QmJJQ4eNrEtGEX9a5djCYaxug+jiXQHP0U8a9h8AuF?=
 =?us-ascii?Q?Wq+9XfruRsVJyH5Kt0LNt3Xg8BmAV1N4J72LihLhnjVBIneypD39Uwxdcig5?=
 =?us-ascii?Q?kQT710F5WMpeAjntJnWc7xmhPMGbetni9z5rGPKWZ6kTtsG5Y+B4G1uC2YYH?=
 =?us-ascii?Q?ezlLDamAzyMZJXzzLHFP5zCAvGHQe5cC7WhhCx9/kZPmcOZGuzww/IiXqR+W?=
 =?us-ascii?Q?627q7QYzi+Ky1lU7NhYgIcIWQ+wxBNveiCROrx/eKyRTnqNd68GYLgGGWfxM?=
 =?us-ascii?Q?kquyVITHjwde6LcAyMJUK7IMd2RTE+bMP+n7q0MvuXexmq0p1o3POLKOWIyc?=
 =?us-ascii?Q?PEiog1qN54acJIjjDX/Q8ihdeJeJFRTlZuAEH05S1Q121gqNfqB4TiaX/S4g?=
 =?us-ascii?Q?QfayRPVbNQMovarSsTgpMUNj+7jWiUj5IiR9rQLd4iEZPsWljCWpOePnJOJT?=
 =?us-ascii?Q?nN89y5Ca7dL/mJO4rzrUqaL1Df2F7LKp0UTJit1jR3h973OKDlw10b1+wX36?=
 =?us-ascii?Q?CjBY2tHisd57+CxqbnzrEDxZ2W15uSNCdAZgLPzCuh2sPu2ShCDL4T3WNxdQ?=
 =?us-ascii?Q?yaKskAnjM55d4li6b4UddFI3g0ptLN7ZF3298F1HsjUy/1JgwaW7FRvw5O84?=
 =?us-ascii?Q?1358uCUF4TPWxJFvAWeQzC+McOa6G78UkHpA3QxKWj+FlO78WbdXILfGt+xE?=
 =?us-ascii?Q?tcOV1iVksQeaK2l9D8A2eQceB0V66St0pzc498Qd7lBQjQpO6l8UpnUmrk1h?=
 =?us-ascii?Q?eZyYJbopzmpMtpcUf2Mmzc+SGyyjnY6tRaAeXiaIwuTpZaXi5Jk25SSHBNzj?=
 =?us-ascii?Q?mehxfrdLPtKfZPKIGBk1MiW69h0jHFcywlM+nsnhmnbh4+lbwGhIEAt69wtm?=
 =?us-ascii?Q?5Y9cEuLVlb0noVRqrFHpLssmlQxFnBt9ESwQBmcTinqCFQwL9AZIZF8WAaqX?=
 =?us-ascii?Q?/4Hk3/GpPlSkAevT5gdCGypIqK3Iehg0IZ4qdlzEJJJCUzt+jG8bCN342INz?=
 =?us-ascii?Q?qZHxyqX4ZrW9RuO0OGheNgmAk64NmbwjUEZrbDikZXG44QzQSBt+oMC+aJlR?=
 =?us-ascii?Q?5GeNNPExJ49lFCV5NPy2f2BHRbTiF9riwc5c5F8jObs+bVYjROgiZv7A64+z?=
 =?us-ascii?Q?KUj1nE6iqhYlfw24o42DZKj/oOJwb92b26lX4FKFws6gxTGZiRKBqaXX8CBA?=
 =?us-ascii?Q?fWG7YPkaY404BLwd+u3IHEKuXpQYSDrlhGSC9yap+fYlIyGdc3lIHwLO3+BE?=
 =?us-ascii?Q?4aE63RMol4OuRvsR709y+WhVmIMVxdWoBJBk6VlhjlTwOjSeRCiTrFcL6RrW?=
 =?us-ascii?Q?Et0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wze4AytUoRYEP/NZvl3Ftd3xKv8wRMf4R3wATCQgiXh2BbbR2z/tXdmSChjo?=
 =?us-ascii?Q?dDJNDDOmU28YewtTVNQlIufXYEK6D60j+ogovND1Kcbcn3kTiJbhWzsNRB6n?=
 =?us-ascii?Q?FMD7O07WxBQ3W1YlYsOwsRnCBzHz8Dl+JL8Y50nhWV9c6GcO5bdp00gIEaw4?=
 =?us-ascii?Q?IAMIvTopeJkYOJ03+0EEdtYoOwBhNHbbf7tXQs6+qaHVUOQCA6npL10fvLhS?=
 =?us-ascii?Q?DoB02D7Omcg2OlTZNaYGM7n6e4Pi1v4ocJoaZY2V1h2LIi8EmE0a3G10wnxT?=
 =?us-ascii?Q?IgtTJhWt/Szxso5SHLBG/+kx8H9jKwMF/m6fPe+goiZDsEJ76Qx8b06iXZnw?=
 =?us-ascii?Q?QPdUBr/te6yphxqXku3szvXGgqLUtR+pWmLvCU1wwvnGrFv1CoCMxyu0Z26/?=
 =?us-ascii?Q?8lE6qPIX+oTKjj889FIV7L3T9ObDSraAUW0Hd3KQo01ByP5PbrX1WiN9+QMG?=
 =?us-ascii?Q?PuhAzjHobLhVKPe9qji4jvBkqNFsQ1Rzh4v63rot/5fGVYfV+36qawu4Ev/F?=
 =?us-ascii?Q?//GmB/Hw+qKKEskf9h6iBuUAZq6cXxtkCxdogG2VKpMt2+CNzSnOkUk5XxSJ?=
 =?us-ascii?Q?lVRaKiGZVsFtxjx9J554yG0A8TELoh3s6YdtlLAN4bDjFHZmQyouTogqp+U1?=
 =?us-ascii?Q?1exEkF6p827PkuWlxSHOZ+nkprde36A7hFfGNlzWdRVMd84aaO+PQWj52250?=
 =?us-ascii?Q?Nw5jrMOQ+Om2xfa0zfLQA1t5UrRD1u4I/jPNyDZ7n221TcD28J6uyfO6j9V9?=
 =?us-ascii?Q?ZK8VrNJUJzmx4B8NEUnpsn5MP38B40i7PN31jbHTfWMOHnP1xu9iWcshU+Xq?=
 =?us-ascii?Q?K+PMWa0MdA4T1qZgZYfLnLCsj6eMXGI2CuxGAkcT0BHDGV3VvmghDwHSP81u?=
 =?us-ascii?Q?lWeC2Fo5GuBREeJENIE3Dk0uunbu2+5oxvrKbI9z63ZVUvJ86K0pUo+6W15m?=
 =?us-ascii?Q?xu+9TZpTKAmx6GXD8PwD885j9wi8ba2BPqa8LU0W4WGGf6CVR6k91WEt6X+7?=
 =?us-ascii?Q?UA5cGN86Sv1bMtFv4Uzk2KUfZKxhI8ahkXcs8/B7srwZuTxmKQ/72uUN6AIf?=
 =?us-ascii?Q?vi93l1ZgjBI8EBUrShFwciDdRnDRvU/He+WZhCQRz4uBxoK+7hKHpRaLSbXO?=
 =?us-ascii?Q?d4Y+FmrzeD5NQxO7B4/QJ6o/qLWqqAjtsdkWrh8rGmE2GlhVdMj7e651B7uZ?=
 =?us-ascii?Q?EMoo7A7OaKj1qIpwAMLCldR3v7btf8bJGO++aXd2PHusTgQLHVi10jGRTBWf?=
 =?us-ascii?Q?Lca0JkoX5mJMCCd9xrVCLGo1KqLwbNZHkCFsOKWvEa/01PB5QDhqTqmggsto?=
 =?us-ascii?Q?fWhtnDcjc4sq0Ptl7jOG6n8DgFjuPzqX5BMep4kGoTQz1d7dSu72F9KS+S74?=
 =?us-ascii?Q?YvYZmBfTb9oyY7Jbbxgc+h3d6hX7q3MuQW8Yx8ftx0T3y+VxfC8dZRnkhSFc?=
 =?us-ascii?Q?nipVhOah5l+FmB0ImrGoJidJ+I/biCBDgdSfxLun7l9L1QB5lY2gy7xTAvpT?=
 =?us-ascii?Q?SsoZDepEmwF+xX/fCJDDuzDZDUApdKW1XJVELW/YE3s4PdK36yR4l8kYy9Qc?=
 =?us-ascii?Q?af/JAODTAbq3fZnrD5nunHXWhBEHt/YjPC4CXSglBdmREllF+Uf8WJrym6tD?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IabvV4al6hbh5nA8Z2qtjNEsbEO3t9IHF3bQ8ESPUQAtpsEc+6uiv+X8I6/hzZXUY/tBGuxXLxzqGk1/gSHHaU15Cxh5WCL4c2SP0Au7RMF/PAhy/DxlkztMyyw0Bvj7yxTJR+R4tbNhpNsZSnY0KbsVnF8GcO+GCEM1ggdDV0Gd7B1FoBVuoM1nB5Bb/i86BEdpL0XKxm7Ok2BxLRX7H89FAx39qavNxTTZ/dZ03jr7HGQWYeCPxfaYa1XlxlRDV6gzu7XePPsho4RhitSgnmT3kGkYgHbe1NQ3dFc1zb3CnPE+Sd+PCMeIk5K7U6oPywljHla9HuZs0UEhUsfOWShmk6bb3qW7EicdAHe+1w2BgDOFQDm8aVijGvyJEqwj5fXasUZaVq8rQCM7kDrYCrRUnQH/dwnuBjP78tc/l7QATR4mQstP9mADQKftAp19b0p85DAZLpLmZPtIUcGUxhh5sxV2sK2qqjAN59Q4YtCea7/Oe7V1CxiHGypuZJbPKZ4N4q/stLalQqr7dc/iFHbBddxjTo9Iy2tfV8rMIqIwQ3MNrEa7OuvIc59ux3PAQzGaJJnEYZRbDD0F3EFSx04YVApJpBllhDergjb98qc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20c4c72-bab0-4b89-1adc-08dcfa8de108
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 15:57:25.3779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttW2zXuYNK7cVkTfr9rh27h88lQ7WPTfilw0EFnEjiDMLQeHXDqbsNZre7uofOo9CGz+tzOhVz/iYROQ39+Zww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5810
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_10,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=880 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411010115
X-Proofpoint-GUID: pkrSHxunWNCHgysE0pOlqbJr2vbloMYW
X-Proofpoint-ORIG-GUID: pkrSHxunWNCHgysE0pOlqbJr2vbloMYW

We already validate that they don't exist in dof_parser.c, so no such probes
can ever get here.  Handling this impossible, untestable case has just got
harder, because we'd have to skip DIT_ARGS_{NATIVE,XLAT,MAP} records too.
Just stop considering it.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dof_stash.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 8bf465678217..82fdd3174759 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -586,12 +586,6 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			if (err != 0)
 				goto err_provider;
 
-			/*
-			 * Skip probes with zero tracepoints entirely.
-			 */
-			if (accump->parsed->probe.ntp == 0)
-				break;
-
 			mod = accump->parsed->probe.name;
 			assert(accump->parsed->size > (mod - (char *) accump->parsed));
 			fun = mod + strlen(mod) + 1;
-- 
2.46.0.278.g36e3a12567

