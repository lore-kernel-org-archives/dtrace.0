Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F961ACECF
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675458; cv=fail; b=opaGJif6gu0fBAdByESirvPAUcFQ8P0ehj1RlE0cXhp7cpF0f2cFz1p5e4OlGbgeUuz7UpclKd6y+AkKDboz+arZWGrulKPNbt2om4theKODPCNXqHqefQORXwewdrIU7K3UGeLFv5NiPbO/tv56whTj7GEgz2O9znL+PPnc6Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675458; c=relaxed/simple;
	bh=MWatEwdpntwB3nnUA1ya3d/WT2euU9aCGhXpdWukjZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HHJAeLgCGnUEHb0a/OOJYL4Ud4z5vXsXVU+FdnIJy4gESVcGyiZBs68WI5Fg+yBfDURPliFLiifEt7XDH2doLx+AEDexm238Nytss0b2CvMnaA1nHeK2kfOqTk6+DEPaxiwo4lqKNXWVk32V0yQFGGIpmL5sMbhKQZngJ4oNqNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n179Q/TJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LbELsbn8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n179Q/TJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LbELsbn8"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RGffs1029669
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=kEJ8XY16Vu4FXgBNWu
	hB+8MZI5KJn11G0RLenMAKbok=; b=n179Q/TJp5noqBGt+12zFUDMJz1rIMEIFt
	dTD6MSZ692a2UN7voNZUR3pO0VI1vGeYEkUNJ3aea1GnukbGrDC1LcW6DnysLBd6
	/ptpSmbgkW7X/jvVkvwJmlwSn3rRiiV2jn+3WC1Ru+mJV0Hkpu5rDrt2vJ2w+zbg
	XhATQJD6CplmeUkQ9fDBVXcW/RxTf2QRQApC/OlNcteUWPbA4/feO2MBy9HDylPr
	9Lwp55JvQqPt0Lg7EvQ+W79HwB/UTA7q5ReF+Tysn2eo0RzmxgtY6Wj4DhdRzZSt
	YmhGK5KGFLOP0hq7TUd8Uwl6SvNKycldFWhfjiAja9Dd08GPG0Lw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451pscbvfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:57:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51RGVpiN025455
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:57:34 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51jyrte-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:57:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThWQLvDmvTMzjZsLxU89yYugkqHuPlq/XRmUfK1K09p9J8EZbAw8E9d9Zh9qyVOg8Mdft6nQqReJ1WEm4t14x9GIEXiD8ZVwNh+oGQsdLdOjJWmBqcK8h20dHz2beHcuAUt7ownpt6t5t+dxztpaPqQMo8giuQDtHx8jktbv85vp/9YiUOmXRO3qw8/bADF6t7wAc758QN21Z34JWUXLb4LrYtR0qsmtxGnhbtJQa/TbPAj/kt8q1QEYe+de2e3LYFCatj8cDHjkKwhUms1tudnEl1x/yi6/kV7B54b+ZNjOho5s4aZNzGoz1/RFWuXlkzpC3rv5fL+F58ZmmJVKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEJ8XY16Vu4FXgBNWuhB+8MZI5KJn11G0RLenMAKbok=;
 b=QYo7EPxWqB2pKbGBer8hFjntUKUM0x60yM1grhGa3OXgLG/LgOCJEv0zfJlsNp6gAHDZ+MzcYNQFwby1umyZtF2ICd/MhtrVa6HPjpeTvTDj9w88aW9jJ7bbifiDyDvjgz1q6QrjrOgLboIzK1h6c/Bgn2QeNDEr5mJMWT+y2tEVAdYqQJktxw9dL9IPuSUCxJjncf7qCjx6TROGgwht5dq3MNxrMcJ0IsPgqqRcsOGPgDRJFg6eKkjZlYoAXE77GN5BBXDuik5odlJvysc9gsYZMYHS1UOflD2w3qFjWtqhDxQwQJWhNFbkZN6DNZhkO7292OynJNHDZlZkbb+e9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEJ8XY16Vu4FXgBNWuhB+8MZI5KJn11G0RLenMAKbok=;
 b=LbELsbn8il66pttwslSHnAA8j6aJwOzEL5ol/x2SY6g+Q+/rIId6x7IJL7kfaFe43hYMZQ+aAw10HCl07qVaPLRtkdlidANtB67iDO1Sw/z3L8CWtq9n9u8fozqSSWVjtd1sw1kaZ0NRJyQLkqg4L+mR9ZOrMvktu1N0rRn9FO4=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CH4PR10MB8225.namprd10.prod.outlook.com (2603:10b6:610:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 16:57:32 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.020; Thu, 27 Feb 2025
 16:57:31 +0000
Date: Thu, 27 Feb 2025 11:57:29 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 2/4] Eliminate DT_VERS_LATEST
Message-ID: <Z8CZeWljSdAozsZH@oracle.com>
References: <20250208190622.23484-1-eugene.loh@oracle.com>
 <20250208190622.23484-2-eugene.loh@oracle.com>
 <Z8CVjWt27pWGpPyG@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8CVjWt27pWGpPyG@oracle.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CH4PR10MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb957a9-923f-4551-b828-08dd574fd367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v7UrKx8koJJSvLUiEGvt2pm1BlY4yWY5Ub3ToxRW3SYkfA6rh5cq7b06H14A?=
 =?us-ascii?Q?VxDrQq/cVmqhrEhF2+MGFXdtlQQIUVMPNfyAyLk2ERnG6sWrDd16ZhEjlX/9?=
 =?us-ascii?Q?D/TJr50lgsejb3OcAOkJwpB1TTB95M06sKiiG3qBfEKyrKwx8D+rzj/SMNyM?=
 =?us-ascii?Q?DIxUjEz88hMXhi3Vn2TwIWW8a+EP0fSx+DTxnz9G6T2TDwAxesI8MN3Pf3+f?=
 =?us-ascii?Q?3f+n6T+FJ+H0d72MGif6nUx+Z8Zf41i/tMK6DHzAdPuuyMBagjnw7cT4K2cI?=
 =?us-ascii?Q?uihM2NeY9bKMl7V4xdmz5lkD4CG7hiGYnvRfQiM0zgCBn+mQbEYlotiEw2d0?=
 =?us-ascii?Q?XCq6UqRexO1crlZSAS4CaM7a9fNc6Cl7DvzxzUy2dA30XFAvb3AqfZLsxbtS?=
 =?us-ascii?Q?EgKi+pyLGgIB85yBO/MKMR+ws4rPg3RMOgSt1gPDtU2sOPdwR5KkyvCxysSx?=
 =?us-ascii?Q?43hWte/jtgjVUIxixlHugca9cqeP3xUSEuXIBNqLnJK1E6e7CSuED9pt9TF0?=
 =?us-ascii?Q?cIfNb8ofLB0NDuh/Xtv94ohGAWKF0+MYDlW1eKGdaEA/nWNqxU3JJWwl34Eg?=
 =?us-ascii?Q?NBr+6JoBc8e2/byFdCjYNH0ol0vWcyWyxUGPAiUVVVcPYIlIKlCdnulLhCtq?=
 =?us-ascii?Q?eP6DxNFTKYBvboLWACBYYjP/MMjSpqOQTlPn86zxIIPC0rDpZni6ASb61IhU?=
 =?us-ascii?Q?I7InkDNLr++Mox0bAm5E2wJp9BcZsDaxCZSi9sQv/T/F+8JC4l7o1ttTC+ra?=
 =?us-ascii?Q?xNc25kCN8PCl9JGJ7CjRvtAJyuqDrlOt/eDlCXZs3+i0fexwYljhpVmywbkq?=
 =?us-ascii?Q?cRq1Q8fDU2uRVvU3foKDa70lAr/tiKqBTVRckZuwWwWwGgihmUH40dXYWgdd?=
 =?us-ascii?Q?wIG/jAFbBjYEznnobEuUgatf5c2DgnFsajvVwPGUUYGvgZxNqJiVRaNYO7WT?=
 =?us-ascii?Q?bUx+gvUTNdOkfRAhDkIqJWesO1AmJ+kY2iFc9q4RKUMBER6A5UHVi8DP9Hcx?=
 =?us-ascii?Q?FK1DppQfDs8wmdjb4XGwzIkTSJYwaySIAdYKQ1WkQnw+i0rRz12RFatAd+Cs?=
 =?us-ascii?Q?NBkUB6oHXIAtCUpKDtJeVQUud6Z3HdQYPTKPdDSRR+lnPCKEIhjEpcmSv4xt?=
 =?us-ascii?Q?iJWYQGzPRuktcMmrZhiZJJGEuqpbJiGwC40wdyGJ+BmawtvKTs4N4gR4vMXW?=
 =?us-ascii?Q?3Vyq2tl76vwC/qLJTROHc2yG93h6G8i0EsVB1rrck+aP1KYr7GDO889+ssZR?=
 =?us-ascii?Q?P0ywMQcjnmgBPO+O2wujOg8WVayW1Cp5AxFIoV1ixd05sHIZfBzxngVSll/l?=
 =?us-ascii?Q?uuDSNQ6sli2/Lh8FBxzqJdDSmHDZEZM77laSV/jrZpOzgv4SaItYlFsT4E1Q?=
 =?us-ascii?Q?ej2boXPFaGuZ8Q5478eIfD6DGIYw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yj7UVMQ4drWzfwSRuqP15FBdQ6EPSS9F9IpnyMDdOUwiKQuzefVfJ7l7hECG?=
 =?us-ascii?Q?XxKglTE0ZigRzvmOH5GJtMmJet/VQutrRw434k19I04pSBqB6P1SnCbLNKE2?=
 =?us-ascii?Q?LF0cm9Vq+6gr3iCITPUuvtUjV/3p1rbcxzicmWj80TizMImjasth2WDL1NEv?=
 =?us-ascii?Q?zDub27kVVONhNywNgXTqbqor8NwEuWp9NpL02lLNbjygEP/YVmTlDeGsA+5b?=
 =?us-ascii?Q?AZe0dtiQLkyW/wh2oooykNNdza0tubIQ+NhPzFkK+8OFayvSfFZd0fL+7W5X?=
 =?us-ascii?Q?LGFMZTNAq/cfJE+3o+mn0sZ/CbzuspFAQyYODZFpSNip8U72B6QRDIc4c4Xv?=
 =?us-ascii?Q?/eukDg3FmRquhSwYrDJxk3URFyBRRv2nn+Xanle7D7Upnr8qifahxIpk2H1E?=
 =?us-ascii?Q?pOZKW+dGozQ1t8Gfi68nxE02N2/aObFHuoEo8canOTDQhw3TekmsPhzjKkdi?=
 =?us-ascii?Q?9QJti9raBIzXbO9bOCyQkZ8onlCEF0i91eRMcp/AEkBsDZ0e9SmAE5C6Eget?=
 =?us-ascii?Q?PlV9XYkgfo1lOQdgGnS3RsK59w0jfG4+oN+nJFvXL5pQ38wa8wuHHdJ9H/sm?=
 =?us-ascii?Q?lj3OXG7NRGl2k1GIzvpLA1s8pM0YKifES0bSfI/I578ewHtLHKz/qTsazP2t?=
 =?us-ascii?Q?ejFn85C6esM/x7phWZqMp/uxpWBcwWfWOUlQapfOdru6/4UpnVih+rquajfZ?=
 =?us-ascii?Q?IYaFRtBFsU7ZDxX2yXUnXQQftwkd/22GBu4EysoLnhodclMESqXZIGEXc+33?=
 =?us-ascii?Q?9MqmQuPofNlVSPbqia6mllGKsgNGXeArLZIG764/d6dzLiQntgvvgo8OHNuE?=
 =?us-ascii?Q?ntvQWRPP7KMTqnhkpVxhmtI1238aZiO3/f+96zDscll3UsMdpwoqeFdHqHxF?=
 =?us-ascii?Q?3NnA/l+4tsUDc5YacBQaussLZSlQw6UlI22j3novAM1dir7YZZttE3yLccbq?=
 =?us-ascii?Q?d2Yb9TLL3MBbMkhyVDmS5Nv545Zp5WkoFEENAl38RBEdwQoDp4ZgFlGNHVDj?=
 =?us-ascii?Q?3OO9bU1NtcB9+2WWX0LugUWAlwGGQR4j710Tzszklqg2QctW7YATdrebyeIh?=
 =?us-ascii?Q?Vx2O6zjB5IMCYrCQRefVnUW1KDxvXbQe+9dIzfL5+WHV7LwgvHp8FCyi1VbH?=
 =?us-ascii?Q?erEliIWo6d0q9pjlNabUWWNiU1tB1WJryYFCLN3vAtwNCWDZuGNin57ywVxD?=
 =?us-ascii?Q?fvQC6o6jfNbNs+qzCLaK99V+JakfxHkpetDnU06+H+9/SyY+sashprDI151n?=
 =?us-ascii?Q?jARKinCqquH/gWYRN/r55QMLQwKZfh79NxrbNYujQ0dBhnDFfvmqvm0nx1Gp?=
 =?us-ascii?Q?Oon1rFaZ0VYVBDdfjPqPurjTUEDsA/wt74Z2UJGgh24ZvlaGYe4ZButcifUW?=
 =?us-ascii?Q?bWx43bSc/CwT2fuGjsP+na4OTYA+KDDppcDA+IcIwp/jp8hTS6l1zRIMkkM4?=
 =?us-ascii?Q?zu0DPmCEhYUYPA7XKB4HEutyZ8pFwktG8wBHC4vP+r8dpDhRhGJT4J/LsZmX?=
 =?us-ascii?Q?Yv6OxzSyVPuQYLVeqzZOI6BEtb/NQ1a7MbMQWstqDlG8VqzURiz7zF1ysV5u?=
 =?us-ascii?Q?lwve3BfbvMLpahw4BdGRGrPOkfQ76f+GVYifVEOlAPhlXUePB0ti4lkxdnVO?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M4oVlOj7AOKh/v3UTfQXHPneeaSX3H8W08SDchFcnRsOLI7iywuOjjCu3drgNskWz/lkCl1+e/oFTQwjVivVxE8gHlJ0Fc6qpBot0EkjB6p3EzRYUMwMbB2WtblsJINSPIbpQUPtCjghDrzHhfbrmwyJjgx5/UtmMdqMQ0s1aZXNba/ElQYRyXmnia2OdBxnG0/GWc7kWMxznc+8ahRFj9/u+phefEiBhdl75t6JuU3IWepy7JwrGBcRbat2QTR15hhiDfjYWzNd6srCsesYLCNdCiwBcojaZrOdmPpYu6g20mA3QouadbJMk58p+4koawThjrh5bsAmo7c6BoUqw9YYr3AbOyGhzYwryLgchl63WNjCUA1SJPgqgzWUT0b8IwoBDN+68/rWfIsPklqdhs5ZvaVWhRbhZdqHYu3qxeqJHg+/rJK38AFG7EMNMHurvrCCJxetLqd9WZhuWkvBKV8X5L7xY0TPTb8uFj//tvQ2CUaDMjDp1lGnQWmZZreKG77ru2r77/GpHKjZhdQaKNaxrGHC6EcVMU48xstqHip4hKZ2XJLC1mTcc/0u6biSkReA6qs0uKJFtwOo2GvVI+lwECke98boZ8vzGyaVcSE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb957a9-923f-4551-b828-08dd574fd367
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 16:57:31.8973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MNTGOYRN4o3eSlbrw8swK13En0jVjS1iYjtYmXI/UQ7QJPZAVUPMkDsmqTdwfag3yeB4v8R149rlecoDPysrAHlMwPXwIFdF83kZdVYSuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8225
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502270126
X-Proofpoint-GUID: KH-JB9AH3WVvLpnaST-cVtqYaKP7duoP
X-Proofpoint-ORIG-GUID: KH-JB9AH3WVvLpnaST-cVtqYaKP7duoP

There is some overlap with the patch that follows this one, and that got me
thinking a bit more...

I think that we should rework all this a little bit, and have dt_version.h be
the sole source of version number data.  We can put macros in there that
provide all the version information (strings and codes), and use that to
populate everything else, I think.  That way we reduce the places where changes
need to be made (somewhat).

Let me muse on that a little and I'll follow-up with another email soon with
a example of what I am envisioing.

On Thu, Feb 27, 2025 at 11:40:45AM -0500, Kris Van Hees via DTrace-devel wrote:
> On Sat, Feb 08, 2025 at 02:06:20PM -0500, eugene.loh@oracle.com wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > Updating the DTrace version number requires too many distinct
> > changes.  Eliminate DT_VERS_LATEST, since it can be determined
> > on the fly.
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > ---
> >  libdtrace/dt_open.c    |  3 ++-
> >  libdtrace/dt_version.h | 14 +++++---------
> >  2 files changed, 7 insertions(+), 10 deletions(-)
> > 
> > diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> > index a02058871..b4d160359 100644
> > --- a/libdtrace/dt_open.c
> > +++ b/libdtrace/dt_open.c
> > @@ -721,7 +721,8 @@ dt_vopen(int version, int flags, int *errp,
> >  	dtp->dt_proc_fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
> >  	if (dt_aggregate_init(dtp) == -1)
> >  		return set_open_errno(dtp, errp, dtrace_errno(dtp));
> > -	dtp->dt_vmax = DT_VERS_LATEST;
> > +	for (i = 0; _dtrace_versions[i] != 0; i++)
> > +		dtp->dt_vmax = _dtrace_versions[i];
> 
> dtp->dt_vmax = _dtrace_versions[ARRAY_SIZE(_dtrace_versions) - 2];
> 
> (-2 to account for the 0 sentinel value)
> 
> But this will only be accurate if you also add 2.0.1 to the _dtrace_versions
> array, and then you should probably add 2.0.2 to it also for accuracy.
> 
> >  	dtp->dt_cpp_path = strdup(_dtrace_defcpp);
> >  	dtp->dt_cpp_argv = malloc(sizeof(char *));
> >  	dtp->dt_cpp_argc = 1;
> > diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
> > index 3fd1b3d1e..bef3243e9 100644
> > --- a/libdtrace/dt_version.h
> > +++ b/libdtrace/dt_version.h
> > @@ -38,18 +38,15 @@ extern "C" {
> >   *
> >   * These #defines are used in identifier tables to fill in the version fields
> >   * associated with each identifier.  The DT_VERS_* macros declare the encoded
> > - * integer values of all versions used so far.  DT_VERS_LATEST must correspond
> > - * to the latest version value among all versions exported by the D compiler.
> > - * DT_VERS_STRING must be an ASCII string that contains DT_VERS_LATEST within
> > - * it along with any suffixes (e.g. Beta).
> > + * integer values of all versions used so far.  DT_VERS_STRING must be an ASCII
> > + * string that contains the latest version within it along with any suffixes
> > + * (e.g. Beta).  You must update DT_VERS_STRING when adding a new version,
> > + * and then add the new version to the _dtrace_versions[] array declared in
> > + * dt_open.c.
> >   *
> >   * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
> >   * explanation of these DTrace features and their values.
> >   *
> > - * You must update DT_VERS_LATEST and DT_VERS_STRING when adding a new version,
> > - * and then add the new version to the _dtrace_versions[] array declared in
> > - * dt_open.c..
> > - *
> >   * NOTE: Although the DTrace versioning scheme supports the labeling and
> >   *       introduction of incompatible changes (e.g. dropping an interface in a
> >   *       major release), the libdtrace code does not currently support this.
> > @@ -85,7 +82,6 @@ extern "C" {
> >  #define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
> >  #define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
> >  
> > -#define	DT_VERS_LATEST	DT_VERS_2_0_1
> >  #define	DT_VERS_STRING	"Oracle D 2.0"
> 
> You should add 2.0.2 and update the DT_VERS_STRING also.
> 
> >  
> >  #ifdef  __cplusplus
> > -- 
> > 2.43.5
> > 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
