Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937B38BEC
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 15:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759849699; cv=fail; b=W+oKr/Bu0OcbXa23hpEsp9Dz2tDWZy3OJ4tNzeE3gBKAJXZvLlNP3mD0k5aks589LslzsIm/xGDDHWvE3Ky3jbHbnv7gEjFOSRfH9Ww+vcdYqXED4ZsE0Ze/PagUmNt9kZpXO0tV6RE0+knb0UcigigVk1aXm8pSsjUeHK4q130=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759849699; c=relaxed/simple;
	bh=lf1EWyxiCBSNpf/cZ3vMp/CjXMwKXkm4cspCUfM1GPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MWOjktfCbFfNLVSxlGXvlWToxkmNqAaMs29Ar56GRubcSIUI4P0+6jvnes+zcRmiCPaJWrpGpjY9MY/rq4Rg7gzS+ZoDckU7H/1B9RcxWjMKUVgN6tffwcq2cGR4rZdrTC1CkzHM/0dTBI7re/boRFmIqv/m8+P0GIAnBOYfvtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hOvOFycR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iV/Vc/it; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hOvOFycR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iV/Vc/it"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597EtsSr014759
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 15:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ultPoyAgUtoROfkhfV
	J2/8XPdkBvjEilfAYDewMz020=; b=hOvOFycRP/6n25unykxrv7SHAMBCQJ7Vup
	ZHVnVAw6FJ+sWCFIEpIkMh19fFkjyBbYdF0lMc1nOpCCody/4G2zvjE8BY8yqFCd
	ScrYEYpy+iUazSkc+PHKubLHBlwH+fNy6Fzb38YjztzIYC/QYYiqu84lb0cuQXkm
	9sy/OO1cZtTNVhjhZr4B8VcdD38/RC416ldRZTs6qYIn/azc1SzBrjotrJYldj2d
	9mh4JuHlcMcPR1iy1ak1Fvmz5AgZ7sYZq7F+7L4a9UE0PTfW8BiKQRBiMUqUIk0K
	id7c6G5C02VDAcmkl/ZXsLXze8kqjL9RNt1p0ena8WmLanxEH8iA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49n2me0ewr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 15:08:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 597Eivft005682
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 15:08:15 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011051.outbound.protection.outlook.com [40.107.208.51])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt18jmd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 15:08:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9Nw4Y7WNzQV1jW6Q9L2UJmUdo75SSBtAuPfGJjskfltDpQLfZrz9ClAYPqe/qx7pWEKkbr4Xb+E7H/xJ08P0u2FbnGJzOMKMf0jKvOpYqnFKiGMg+LVqqSvaxKPFKWM4AQHEVGtpcnkFkbei7cDG77Ykzh8zM6iHSY9m7QHnFYMqJfqSjYiekRrleRNrO+11uFftvSqsMfh0NHw5EGmfeP0drthpgQ1p8ghpYoZjT5eeq3rrE2Qv01vFidLmNupvI3x+nbo7hm9bfc6AwlAZ1JK4koQ5QcN51ONbscS4zDwVwLLL4hE94Q8UQmNQHYJkqIKqfmFpYy3G08i3po1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ultPoyAgUtoROfkhfVJ2/8XPdkBvjEilfAYDewMz020=;
 b=THTHPIgqwPaJmE0gRM/Rq5tjxSYpMwx+Sr5ZNniQorogd6vqlQ/iOxFKMLiYEHN+E29aiEid9fiuL6/Hme2T5ErRBHsODA+LAlVKl4TBGdgRC17GYoPxxsYbpdNyRdnEKOfQXKYFRBPjL9zbTiTQHDElbPqZCrYpyWr+a9Jy2FdRKdJQhACFUP7m9ft3f5XIFKeCnS25/HoW8k/WJXMeCraNRjH47gxBSRm31R12Ko4GJfbwWIGbr6p99XRv5fh4/ebyG26m+juInsyr5w3E2OrVEB/WbCd9Q5orCxDAlsx3MabryQEPgvDQXkMDxQDG2YoJOFh2fwt7q2sWTFohbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ultPoyAgUtoROfkhfVJ2/8XPdkBvjEilfAYDewMz020=;
 b=iV/Vc/itrILbYHwfnJzfkcmIw428FhMDRfhv7/cfN3qu2gHa2ugBtHX9o0KKHaqg4cAukytg8m/3aVEvJj4JYHyrectzTadQV6gYbhj//E6ukVbsM3H1/xfD54cg32O5D3ycsG2mfvfq5lETMMDkDIyFATR8EH4JoMu8RflN4Fc=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ0PR10MB4813.namprd10.prod.outlook.com (2603:10b6:a03:2d2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 15:08:06 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 15:08:06 +0000
Date: Tue, 7 Oct 2025 11:08:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/5] test: preprocessor: work on GCC 16
Message-ID: <aOUs04vrMHwuBNN4@oracle.com>
References: <20251006152829.239100-1-nick.alcock@oracle.com>
 <20251006152829.239100-3-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006152829.239100-3-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ0PR10MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: 789fa360-03e1-44a0-fc2f-08de05b351ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7DOyriTFoZ/+W3V0rZ6Obj53r+KLBZu/lUzsZm30Iap52xYKHMhFIcJbExQx?=
 =?us-ascii?Q?1PYigaYeEtsIbTb1YzHNPQVHs+lMaiVNVIv0QRzzagPBz5oXNiPDTel1dJN6?=
 =?us-ascii?Q?9fE3zVUjsRclR1yMb7jS4GFPhOYR6yeU3GCS9uMLrQYadAqpRiYTm/yJLNTQ?=
 =?us-ascii?Q?rnmu5112w8wdxm0L498L4VU4F4PZiir1yBkGUEbnD9QD3Gt3HWqh2rNZhW/9?=
 =?us-ascii?Q?YYvKgx2iffhUCD5JZJOWm+qbdkDXzoPfAnghxK/o1cwht8603arfBC7rMQvT?=
 =?us-ascii?Q?Ht/gsIrnenoqPlTYDob5W+FeqAKjuL+6I/poumQBHpig1Dn9t8ibq0thdsiR?=
 =?us-ascii?Q?TfABdrM0Xc6nTEy27tRHikZxdBF1tfbIKQ8SMdc9wpwvyid49k4Q7PGMqaoE?=
 =?us-ascii?Q?VyPZ93u6eVguF1AGEOQqcG8szvx6RE4qn3+omMY3qn3R0XIzP3S2m1KaG6xM?=
 =?us-ascii?Q?UvUskcEJfzYDEO/b7O2FdMxhcJCYW3mN4g/N0x2yoW/JOA783jziIy59vbhG?=
 =?us-ascii?Q?J5fCY2IZB+HI4LxP3MJPLgH4VmbE8lGunN323Meroxa0TGFkYBgz6YvQcy2v?=
 =?us-ascii?Q?ugUaC8I5GdecCCFRxe6w8TKgwuu2NHKRv6R7akb1CZ8sVm3akYAob7DMtLgT?=
 =?us-ascii?Q?CGgfmfDop/9Cpm6fPz+nstpMALsS88VnJyInHyY6L0v+s6tVU+ywSZPe6Pcw?=
 =?us-ascii?Q?7/anaRldl2yqHH8EXSTqd/8D0bWltNtMHmLdETPtBIEPOh2KoNYUnRxqwqsa?=
 =?us-ascii?Q?PGQXohCvai+Kz+T3P+jUGnx7oQXvxQlwdjmemfrR5U6EvxLw0Wz+slxU/RDD?=
 =?us-ascii?Q?MhDJ4nmMuvv7lj+REIAgQIQnnB4ogvutH0XZJXaqmjYZnDMwQ0cDyqZMXvCU?=
 =?us-ascii?Q?602otMfrhCf/JnZg1W5Irwrnr0XI+xEIQ4JrxFrZwAEAWixpfepYkCQjzTnv?=
 =?us-ascii?Q?Dp237gxGn9FUaLK4azvWG4RDRnYgfzlgoz7KDbYzHs2aFMbWourVJvg1+gGt?=
 =?us-ascii?Q?oz/SLrZuoC9eBTIagQ7L0C+luK604iRpvsdBiy2XXNZ6kVacA4HW9U3jgq6L?=
 =?us-ascii?Q?DWgxXaQPhc8cGYJ1sTp0INrgKngi7Y+Rugzpn9Pxq2ibbbI44mVnk9M47H20?=
 =?us-ascii?Q?2Atvx1L+i74cDHiMorussk5StibXDmtFsJGC/EWf3VGu0AzMbgRnB7fjQ8Ud?=
 =?us-ascii?Q?BPlgWRN8BrF4uG92PqaizMPP01HHhpcoxRBYEhPDa2JFoKoVeBxmkE74S/L5?=
 =?us-ascii?Q?ueoFyWRgou3BivS+MkFVuBxO8ZzRWrwmPa+1RYrlHEklbpQg8j2CsvK6Tcse?=
 =?us-ascii?Q?OOlm6pQMV8fiEycUpXUg6wVDYNW7Zt6b1w/u5nmjJ/v6LpDq/lgQhCEbm+C4?=
 =?us-ascii?Q?XsaS3cFy4clsO9H8GdUgnt/LNEPNjCHWl1fD6T7S1jf3tJZspdj3TcwTKQNO?=
 =?us-ascii?Q?JEbN8KZKe22PGt5tCwfg9pxuNy6ZlBIo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AMouXCSkjr/2sXf3IQCE5ssSUX+w+n2HFNzZkZySb7zpRPfuxPFnfpaAE9Yd?=
 =?us-ascii?Q?H4XmX/BQwwkcGMBhNGdVtzrV9KhDsyTAYbO5WHepeqryMi5sVq90viQ+GiDB?=
 =?us-ascii?Q?UZyNy5lx/yAP8hgXCUpOMKnrS0UZg/1RH5IXxZB8B7i8SQlKpeB4/ySfp72J?=
 =?us-ascii?Q?oCkv/K3o+gnN0kC+ElclE/g3ccfuneFFREJajVJBKZZaOJcZj4B+aBQNHNQ2?=
 =?us-ascii?Q?cpaljtxcexfCqpptbYOztY0Qa1GdAInxf5OXXxgJSmkOJ2aIcRQRxkc4Gizh?=
 =?us-ascii?Q?aEXKml1KVHWIR36hPrdh3u4N+sgyohnSJQQMRpATwwv2ug9CbFWLdE3gvbVW?=
 =?us-ascii?Q?1TQ+UR1MoByiguLK2n8i37RTArPWAoHeqPyxefLhAtRO4ivEvTcHPiqXfBNR?=
 =?us-ascii?Q?C3IDp3Y+bsN9AZ7sn/5sqk80ejYa+G6BHhFzHIG2QROdZhk6yQgIcJbNaNx6?=
 =?us-ascii?Q?d8+wQFvDcdcOMdu8+l6W7ldvtLiT0+j+0T49MaNakN8h0nZLoRM3S0bFHmCt?=
 =?us-ascii?Q?E/cvW9bnBkKmLX1mGi7v1wL28SWifOy8Ym5fryScfp/0S3F4um2+6Ov+HIpX?=
 =?us-ascii?Q?XzCMDBAmU/R2nnRrPvPiZjYwzMRtPKM6LBZLJ4uNFbdjlgS+vVd2bORsRu+b?=
 =?us-ascii?Q?98/hRykuSrwZaUtEfP5nQ4pKj9CfYnonERUzQiM9XIKnOC30S+VxHizTH0NE?=
 =?us-ascii?Q?int8Riw/TjC2hix4LpyqLiy/JnBWTtHl7ULXhM3e3P965BifqW9jPliudUTK?=
 =?us-ascii?Q?b3pWqwsW2gG5sBpGlMak9fHME3RYp6bXNUSVtN1NZaP4fMKOHFb0N4JJuCgX?=
 =?us-ascii?Q?SEcHEEbISJxf9EnbHoiTf9lP/Kn06hSM+Wr32/e5q1Ohj88hQQNk/ADaQ6nW?=
 =?us-ascii?Q?hdgZIUbLrcKFktskswyday9zRBVZasxFAFS575aZtp3uzhovJrR2/fe82ROV?=
 =?us-ascii?Q?8M75Y3RRsrdbuqzkKp5JIXMB5fv+RI1b1Szy3t2JkPmchekgXt8k/6RnEerN?=
 =?us-ascii?Q?TOquVms+sDoyc/+X42vKBpyYiB6VUMd5G1fcJNNCbg86ScEUGULyjDFX3aky?=
 =?us-ascii?Q?NC3XbCORWtOPnQa1xCVMB3SRuh44d2yGPRCP12WhkjGQNfoZGkLjPhrwR9gB?=
 =?us-ascii?Q?uyEUvOf3Gnc8AcLGrPhTN4XAJFsYFIRHGeufP6kCb9kE2OjPlqjQkW9LgWLl?=
 =?us-ascii?Q?Pgsox7Q46Oo4sC50G/PA7vp0gxcysuw6ZxvDoeVkt96TTVm9Dl240iH4DIt+?=
 =?us-ascii?Q?fN+D9b1CxPVeGdxxCounQ/mumDW9ecTHbpVO7yJxcq8kh9k8oVSX8yrkj7sh?=
 =?us-ascii?Q?POcRQEoHn9mj8ABUR2TyLPose8ya3tvyUb0o4D4hEHjLHEGQ2EKjpTyMXJEj?=
 =?us-ascii?Q?pBlG5yUDxhzQzTbxehJ697SDtkX97Yik+IqfssabR5AlnhD//O6a3DiT7sDB?=
 =?us-ascii?Q?3W4ipU/AypFBIgQADx6WCy01+JanShEhV9KLOQSPsNLdU+lmn101n28jQK2T?=
 =?us-ascii?Q?z+IxOWmFj7SromhbZvzLk7BIWnr33KYPGjMU+m8mw/5GqNNp4Ve6n4Uiou75?=
 =?us-ascii?Q?6j+9IqgvYA7n61BCfABbHWypqTyDsDcActlHO5zu/Oy8VLEXlYXviLoGiqCe?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1qG4/IIcPFPTsfIcJcau/+pUBxU2MnR5OknUfxeJESpD76SHwqU54lpdrYc6zfKXL88KNx/85QhoYT39EYM7/sNAglspV+o3/bXsLkkGOY32bDHw8ZOpukT8HryNA53fgPyIkfdR/8phGivhNzpjD3iCWniLyoBeKfNp05p6DIyRyYOLeuJbiQkc3/4xkE5wYNcQshTyJbEhSsbYjMMpg7f16f+chQ4VpyBKBzDd4cuTVdIIHDWjKOknwFVcqCbrBR1rE+FSe9LRqA0Usywsq7MbDZvTylu8+qZ21CoVNKkg0oGWDunCaIeOt9tZYiOMPkXNbc5KWEgchtbZWsyYD7b1e46rnxGPWNj7gsF9nh21sdqi+uTyA5SfbvSt1HFioweTPRSvGaZqoWAc57pzWgjKy985WWkXPEarSImBp2KZvxTaoFokr/4U69OxlfT/M93rzA3XY6gPwrvlPqN+NM61CZgaOGMh4qOWm8uYgltxzCMBswrawo960N1ZdOpVKr3PwZCxIqhT5OUyjNYtpH7R09wy+50CTtttPXXqLhvbs5xeyvVySXWAogajVp85232gfRqIG4c7mT4kPxSSDR0BWStaIsGYViCxwoV/BY0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 789fa360-03e1-44a0-fc2f-08de05b351ba
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:08:06.3720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /izqcdoTbJvzM5+YL43akoZKOxuiCD0bhveK5YmNN8kTiqOHWJT/xSKqpEAoi/dJjHORBlI/aGrU4B5IzwbK7wxxzRaTj7wxRyfjVXowCK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4813
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510070119
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDA5NyBTYWx0ZWRfX8imx3RApDX2q
 IC0X17xgdq2CQdGY9U8qCB7G2/uU4sVGZSgxJ0r2JnRGv3owkmW8omFQ+zfrMt94Bsey7dC4OH8
 MQxJSCYakUR30SzPBM60kfBqxFci1jv8WR9y/r6PB5/Gti9KQ0V7pS5LVjWW0zOGSiEXHfLlLET
 7pn7WfWIpqwlhHDjbZjOdFgEVVCDst6+HRnIsK7msEf9EcQ8dVSSEdOcVuKtxOsU3CsDJh/0qoS
 H+JzkrOSKC2AY/oo9aKxPC5hOUoa9RGk/buaIGzC8/0zrA9qH/fHBccYwRe36soNLKmrwUKRT60
 +AyvxTu6wYYmU5wI0z5E2F54X9kF8TfQjjf2WZYTdK0Nlstq+6sD7nu9jvoccdfM3OBVVmQvMAU
 cZHwQl9yNjSYGwXqaccUcNMRHn5DEw==
X-Proofpoint-GUID: UoHk1rGqE_PphF0UH5xztRIcvkB4zr5b
X-Authority-Analysis: v=2.4 cv=aL39aL9m c=1 sm=1 tr=0 ts=68e52ce0 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=VPArYNHYT2jVRc4Vo9IA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: UoHk1rGqE_PphF0UH5xztRIcvkB4zr5b

On Mon, Oct 06, 2025 at 04:28:26PM +0100, Nick Alcock wrote:
> GCC commit c397a8c12296b75a91ae51e4889debf023e6c338 ("libcpp, genmatch:
> Use gcc_diag instead of printf for libcpp diagnostics") made libcpp
> quote identifiers and tokens in diagnostics like the rest of GCC does.
> We have several tests that rely on the old error formatting: sed away
> quotes and smartquotes into quotes or nothing (as appropriate to match
> older GCCs), until such time as GCC 15 is obsolete (a long long time
> away).
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/preprocessor/err.defincomp.r.p   | 1 +
>  test/unittest/preprocessor/err.ifdefincomp.r.p | 4 ++++
>  test/unittest/preprocessor/err.incompelse.r.p  | 4 ++++
>  test/unittest/preprocessor/err.mulelse.r.p     | 1 +
>  4 files changed, 10 insertions(+)
>  create mode 120000 test/unittest/preprocessor/err.defincomp.r.p
>  create mode 100755 test/unittest/preprocessor/err.ifdefincomp.r.p
>  create mode 100755 test/unittest/preprocessor/err.incompelse.r.p
>  create mode 120000 test/unittest/preprocessor/err.mulelse.r.p
> 
> diff --git a/test/unittest/preprocessor/err.defincomp.r.p b/test/unittest/preprocessor/err.defincomp.r.p
> new file mode 120000
> index 0000000000000..62577fe0b6bbd
> --- /dev/null
> +++ b/test/unittest/preprocessor/err.defincomp.r.p
> @@ -0,0 +1 @@
> +err.incompelse.r.p
> \ No newline at end of file
> diff --git a/test/unittest/preprocessor/err.ifdefincomp.r.p b/test/unittest/preprocessor/err.ifdefincomp.r.p
> new file mode 100755
> index 0000000000000..7629ac5973957
> --- /dev/null
> +++ b/test/unittest/preprocessor/err.ifdefincomp.r.p
> @@ -0,0 +1,4 @@
> +#!/usr/bin/sed -f
> +# GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
> +# supported, we have to sed it back again.
> +s,[??????],",g
> diff --git a/test/unittest/preprocessor/err.incompelse.r.p b/test/unittest/preprocessor/err.incompelse.r.p
> new file mode 100755
> index 0000000000000..ae9a6833d106d
> --- /dev/null
> +++ b/test/unittest/preprocessor/err.incompelse.r.p
> @@ -0,0 +1,4 @@
> +#!/usr/bin/sed -f
> +# GCC 16 improved diagnostics formatting.  Until GCC 16 is the minimum
> +# supported, we have to sed it back again.
> +s,[??????],,g
> diff --git a/test/unittest/preprocessor/err.mulelse.r.p b/test/unittest/preprocessor/err.mulelse.r.p
> new file mode 120000
> index 0000000000000..62577fe0b6bbd
> --- /dev/null
> +++ b/test/unittest/preprocessor/err.mulelse.r.p
> @@ -0,0 +1 @@
> +err.incompelse.r.p
> \ No newline at end of file
> -- 
> 2.51.0.284.g117bcb8de7
> 
