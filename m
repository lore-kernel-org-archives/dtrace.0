Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04C02E11D8
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824156; cv=fail; b=R4SvdwXJIk+TiiPl4PpcA8StmEWeTLJh0QXGJUpnCpZvcVvJgeKeASYESuu/1nvv/PFkZaRlcWRQhjSlY50zRai2Lk9ubgfh9FEEorr2fNHQUVhr4U30+MNtzqXZCFaiUrAsp/f9afuygZ8LcnOKd4Z3jFRBFzSlg13O+iScKYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824156; c=relaxed/simple;
	bh=QNHwvCnW+/qSG9xOjDSjh90ZJhpJ/D8WgL3HgGcplw0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=UFrLU8sb9s0dTkZYlV2NNzaQH0C6EX/1U53FO9PjeuRVWhZOaF3cun6z3ReVVzbAQOosTzycMsiojrHSKSBrEyePRdmPw7rD6SQ8wKRZJJujmb4GsGb3QkbFqQ58h/NJ5R9ZpRemELY4HFuhOgJ0a8RC6hMJ2499ooWgtLaEdUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mgs1d9Z+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MQrno8gD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mgs1d9Z+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MQrno8gD"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtbPI032660
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=DJeVQXbi/ZY0TW5l9R
	xQoIzqzpSxjarzaZhN03paEa4=; b=mgs1d9Z+kazwNRHx9yaI9E6N+a05bw9uvd
	U56a5NxKxiMj5F5XEnQL0M103V69DY6oj8X0wN38ghqX3qbAlrJ0YAt6HokLS7A6
	Exc6FiQbY7TuUuKvSBsoa73OQxO8hPj15lkzFWpdtdX9QaiF6LPG+T/OEhrUSoR1
	fqWt435wfsoGIadHSLF8MAB+qysrsoy9nC/08zPMlCWC9UO6++Un8hHIXWtM3fPS
	VxnIzfEeTtXFHb2clh/GIIoRFX+810ueYIicaLD7nwNhuyFTeUPECBF7AKQ7JSv6
	8LbDsjfAC5AB/G0Q5pHZxnJRNV5mjEqjAuQVRX7TDAfqYRTAKpTw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1vbphr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:15:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DDxfIU040736
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:15:52 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvdy4kd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:15:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLd2xRP7Q1r2YgDSXqCQ7FaQ5zQ0Al6De4RmuAzvSZzkuC8VvmoT6tJ37vD/N2W9Q86UM3s/YL2HtKFMd4owIN/YVmATXnBC99trCy0IO6t+/Ul0byjftyqw/4MLXkkz2+AbHaG7bhzxY/TA/kCHZimEhoPYn3NlKsj6PLcZxOCE5je7j7V5e8LsRA8OT08w9C7fIR1zTAKw0TR+7qDBJCdywSmpG5DJ6mLrzw4VD3mg+J8hElI2RZMR69L9XFQB48HF4dHHZtU1WKFjiqaDlEPA4Wf9T0WPVLG2+oe6OAf4D/p0qjmfa2G8jAa0inSFhVI3T1JkNAPRmkT9Qy/rPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJeVQXbi/ZY0TW5l9RxQoIzqzpSxjarzaZhN03paEa4=;
 b=J/WoNG/8f8G+DKIBxDdLPSCE4EZvQLrX8ug2R09r+Q1Fzq3BCiI3W+ZkRbqfcz98zq5gQBtPSPq34tCa0+97eLzfRcuuLebI7EK5cN3gzCI+BLkoDACogWf6dOE6f3xJEXcX5MUGpijLMRD+nwuAlcmAadb65UmmWbzqvZ9f8mm+KrEQ0LNn7u5bA/IfYkK7/lRpoT8gVmAEOK84NNlHP6YnTrj6wINEHw9vsMzsw8Md3aAtlN08xn2VTY8xoRsLr5ujM7OkFLANMr50oQwyOUZQ4RnWNqOd8x5l1i1pbjfDR/zbwrR7kRmZv1YtGAVH1H2fhhcab4/GEGEgFYf8oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJeVQXbi/ZY0TW5l9RxQoIzqzpSxjarzaZhN03paEa4=;
 b=MQrno8gD8afa1F5IUB9Q1pzghdDj5Un1+HSI6iw+KTQyRj7zXHsxvanNxy1zhzqY/ntzMcZ0IuuV1eh/LZt/bMBLJpUQ/YPjIX9S7jJPqALcZ1AB1vl1aEaznt+4qfCF+lCJ9sZusu5Jhw6AlcDKmCqGigA6MVAxnIsNL9mGeoE=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DM3PPF01BF54C53.namprd10.prod.outlook.com (2603:10b6:f:fc00::c05) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 14:15:48 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:15:48 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Wait for output to flush out in enable_pid
References: <20250608053620.15468-1-eugene.loh@oracle.com>
Emacs: Our Lady of Perpetual Garbage Collection
Date: Fri, 13 Jun 2025 15:15:44 +0100
In-Reply-To: <20250608053620.15468-1-eugene.loh@oracle.com> (eugene loh's
	message of "Sun, 8 Jun 2025 01:36:20 -0400")
Message-ID: <878qlvenhr.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0004.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::9) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DM3PPF01BF54C53:EE_
X-MS-Office365-Filtering-Correlation-Id: b30a7d3c-2be0-49f4-fb56-08ddaa84cb32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Adv4z0x1HNCBGsr+JftB3l3DGdrc4Ny0W6rJM5NRBm+kcunEd+rN+rPqzopw?=
 =?us-ascii?Q?gezrU92UEFAk8/BqkHQkKVO75w/DPg2ypihbpfR+LNlgZh0NRaZHwRB0qRpf?=
 =?us-ascii?Q?7Jb5PvOZszZAnN/RP3OKqQY1gahfT0Bg5x6szANzB0Ka3zozFKoj2XCCR+ZR?=
 =?us-ascii?Q?Sqet1dgnjcmvVWT+lBKhc1GSuN5WBLmdv+W7GJdCtxYR7jWL1dr/0prQ5hb/?=
 =?us-ascii?Q?uCgivYWkau3ilIfmxtt3uvc287nF0IdYYhLh7nYJWUTsL6v5iypJxk8mLvUt?=
 =?us-ascii?Q?iQuQ032ir9GbVh1p3a9aD4lyetRv+0lYWjwJUlqiWORBk/lLN7Dhn3FitLAG?=
 =?us-ascii?Q?ql58dXIjDl9EpId8Yrn1y0JmdUHv1wvF9s0Y3NyzGDw4PbWy3PYQsd3DGFGo?=
 =?us-ascii?Q?CglHw4Ily9WuyR3480bzK73ihI/UJMj4szdDqyyqql0IOZG+pD4zCbDnQQiA?=
 =?us-ascii?Q?dkKIv3RD9uRh9UJ7d98/71aV1JrVKZOdL0sUYZVZY9Yo0X4QrVp0A3cJmPZU?=
 =?us-ascii?Q?PHgzztycikYYY+R71llIYBZtoqQai5im/ux4q2TMlV9NaIFFcVfFTgqBrwqf?=
 =?us-ascii?Q?410anUk1lI8paMuKVCfEc7GFqseCS+EF5KFyGvowX6KliVE6chj3re4k4YQl?=
 =?us-ascii?Q?XidWcFKxtwCQ5kpIlGyDOcdUHpYce0AS3u6jONIi63ec7+TpSb0K02pyUMZF?=
 =?us-ascii?Q?3h/0FyCTbO629+ZndB6usl2pc+kt7fxR7q/fmXUoh5PQT4WuPcFAm1wxyNTe?=
 =?us-ascii?Q?wTccbwTH4RRQVj+jHSudV/epyxdy3dFNw98a97/0GN2VenSgwUwI8kzxTEUz?=
 =?us-ascii?Q?ge0Noc93sO+v3JF0k6amh2UGVSaZeAzRAzxQSZI80UnQ2qcm/52U7Ik3bMLh?=
 =?us-ascii?Q?jqgjCH4tNSmvIAEzPbXbIi/EnLZiZhv5zKJpNsqorQEgoggavGGo0mA0TppG?=
 =?us-ascii?Q?CRQuGl4j96dL8XVGcUbEo+gdZZ0IrEScpDd6gBm+jYlYBx9/A9S63iQrHRM+?=
 =?us-ascii?Q?MG2kZIiGsmHZ3wFyP/lGefGraKvVv7/QE5dfwA085UEvrvsGMQgHRAqNqKZ9?=
 =?us-ascii?Q?iStXEXlqJ3f1zhqYV7EAWy7i5vW0tj6mtoJxD5zvMq9jLaUdExzCBkmjNR1d?=
 =?us-ascii?Q?mhOPNWmXkul+Ep9NUqG1Mqu8yt5cF6GPJFzllpBymk/C5zLSctAHFz2KyCyx?=
 =?us-ascii?Q?c5S0A75DGyrZ2vV2ENCbKM2JfDhASQzaP1I1hH3Wv6dC4b7BerusYd3TTVVv?=
 =?us-ascii?Q?7cxoZY+My7nPhKKZrSvI3ZQ55kLwqzrJGqn4iIOTrwK3H8Sk3TMEQfoOiV/+?=
 =?us-ascii?Q?EernBVGcTqp05bFm//ftc4FII/Z8SoktnW8n8JN8KiGKw30dyMlSH6Yp6V0M?=
 =?us-ascii?Q?SEHo7A6Bj7gieTvp7oBDsuJMWgPF47MsVZOSUDLi6HjSA5wcEB67qgH4+COr?=
 =?us-ascii?Q?f5jbo7vcWm8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VPvubCAuuwLpQ4oFhJPAkzMvpfj2er1fMgoIgtVmJRrRk2GrD3WdFVTH+blf?=
 =?us-ascii?Q?71zPJsvXxLW61HPnfjSbPEWO1//8tfKtE8pmJqAOissDT4bf0iMTjs3rFXcg?=
 =?us-ascii?Q?GAfLWhZNdsi34qvHxAFUFaUzlpG71xJXgCCwj9TFJi6fIpI0pzTFMIae8xXn?=
 =?us-ascii?Q?1NsrUmDmAdA+pFMWR9jsFhcvq/25jStdXVgRWlFi2rYZ9+3A/deb3TxNxzDt?=
 =?us-ascii?Q?ieMgkOy9SuObkcgQPGdr2VCMk2LZBJg/Ild4YffjtdlQhptGfr9vHZk+XmLK?=
 =?us-ascii?Q?+batw3Gkl8NFaJACev+Pue9p1Wb/Lq2f5yoOb3Dw8dhFq1H2eBbIAleroRBX?=
 =?us-ascii?Q?FnmnWwSfS3COsacRjoRUzcWEYNDfw757KBZJHnqpufJLjo67E+DznIy/mltC?=
 =?us-ascii?Q?lyIBjn5h96Kt3wgufVk2sep4n3CZdYD/ypU2QeB92lumVMm9+dN/AdIvJ4di?=
 =?us-ascii?Q?8WyNzoIOaS7HuMqQ5T0A5wqL0zj2j7WZqUkjbvlEnJxrXHd1VLv4EONQ0Cgs?=
 =?us-ascii?Q?gOF7zqRPiJSXGEQI7mhT1tcZ2GQz9tndde5Ph4f+f4sSOL4NFJXbwd5XYEbi?=
 =?us-ascii?Q?zc+Y7Sr7htxjb459DWLihfvSwoN3TzxfBf8NOBlkfsEAwyo29SZO0mOQJlYG?=
 =?us-ascii?Q?8bESpZYFS9uZ8PRkTAgeruzvduNwQIoYb6jZKEZVYfIRdPhmCCYkeWEy/22w?=
 =?us-ascii?Q?PkV9ZT9AABGoM+Nupelz5ju5dtSl6v1XpKkxpOdd2UsHP76KdcO1eVUFTq+i?=
 =?us-ascii?Q?HRSe/Y1rbe/RdDcQDDiL1vka+864iXhWOUMtUkDKx456GbGKOS0iUN0s9WI3?=
 =?us-ascii?Q?XFTBJAOjsK/6aHgKdfxgRPXLe8laNCqBUfke18cY6tqJGFR77KsPTLNk9zvQ?=
 =?us-ascii?Q?7ZPWhLsXieer9+evpq9v9oXqadQ32V+BsXh6SCBa/BY6xaQMormRjnI2ner4?=
 =?us-ascii?Q?6lHJeEQNI1bM48qWH8oRQdBBgcY4+soLAh0vwz7VztPBvPiIlgiJqr3k9EUG?=
 =?us-ascii?Q?Ms3155z3P72rsiRJpOQY+bXtvfnKN5N35LnRuh9EQ0lYrVKrPhCIlLrsYhDN?=
 =?us-ascii?Q?oTXAh7H6z3k7+z2EVnRq1++9HQmu+qHK+glXf9IaA2aTeyJw8erQRs7gReq9?=
 =?us-ascii?Q?v+Ls2rAlr1H3Xvct9kKfZOZD8xP3V3JmrT+ntUKWA1RcjacfMMjIzTRmdTeQ?=
 =?us-ascii?Q?QEAA3IOUHek/9F7v8rF/6TkD9/3Gm0NdqCHx+3c+2QQnXuY0+By+//brjyBe?=
 =?us-ascii?Q?2Fs4LyOjImE3KYj/DpwsbEreVvdjy83PsZ6IVBMDYIG5Mniq/z6zpDef/ZZB?=
 =?us-ascii?Q?vhN+fXwn6R32Ghnsnkcx+mBfMTI+pF04BnjKvKim9dkcswj0PT4HAWj8DJH7?=
 =?us-ascii?Q?pOsg5DPvxkEUliPiGHi6gjjoQuhzDWju5h0MlJvzOmvyRssmI5fH1LD9/CS0?=
 =?us-ascii?Q?qRWavCp0xnHCCuVRARBSEGOrulX8tijJrJzB+qUCHpQoeNbTOVsCxaFbp8Yf?=
 =?us-ascii?Q?dym0ZflsmOF9fbPKZ/zFDC1MqB9ltQC8mDcJsWcPV6m4r2QnkrBZyscVawhs?=
 =?us-ascii?Q?yQUrcXywy9gz9sSaXZbe6I3vqa3Gnk+hPR3EK82Qn+f7DUP8cRutInjnxJJV?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JB/TbQkYGsDLX6wPdztqzuJyzNp2HYSQb/sMukYA8SAtQfUtZIKAUbgD+q6ZG2uggs+CmWMfadgV4Dkk7TCQhkRWsiv0FHxlKPz6BLGF8tpmw2IztBhnUzHk4tLQCGTtIFLVj6N8pCD33+xeZYa1ClqfST0WgoO8MG5RDZqKnJWEGIl25b5XeskaVr6ArjbjV47+HlztR2JrA0LsJPr4eFIev5WqjzTNJ7mgP/oWtlo+Qcj1g/xbDpvAUJoRmqvTmW+jcnUI/GG5Q9rVmEboZiFKOaHj+RinFHz2FYFShZHpQr1huwOmL3GhjhAOweosyvW0AWSaHiidr1LHmOyrQ3SiGNEq7OsoXPYnqcHB8hl6ZfrNjTPgrbE9Qdov2Ua7eO0LNg1B/3XWI/uDaN87yg/NzEDjnuapOHhxaSCgWvPbWO2GvJc+vzaZIDA7wRLNAn1T30gluQRvoQDvHm0Qu3JWQ4jm/+IvIOBF67Fr2S531s+0zTzzmMUu/Hiy0ajLjzu1j7L+ZDMpi+Fj0XSSkuHjQ5wxpjk5vOj3ghd15rQW7MWLmhlN4Xh36R4wCDdpVI+zzBhAnuqyLx4JPQmn1CdocecLID6X1skJebZUfcs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b30a7d3c-2be0-49f4-fb56-08ddaa84cb32
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:15:47.9526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmBay0YGvUTdnx1/rGs4Eg4Zi9waZZY5QqiFP8oZ3sanbb8q6cQvGl0MaBgRqhn8nl6ZYCYGJmVQblkkpBlOFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF01BF54C53
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=900 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130104
X-Proofpoint-GUID: qw6JcQRNs-JZjEObp4nL76q0qLGhZ8uG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNCBTYWx0ZWRfXx8C6AD/dbWbr BSKEAdGcT6erKOqhaK4ZLHWmZfQUCdX4LcoqHiNARNKxB3hSpIjXOUi7nEWfJvqm014eE1pbigr qtHYfRODv3SGDKq++5M/BXeNDXJ+kz4qMlTuPpM297yvKpb1eSuqxaupJEaq7eABTBkKdZEJDcK
 DMKz/8X8/wE0iDJa9AVYZDUSKUj0gAn2epG8kteUZ/tuPwLQSGHUeIC8W1tIf4VBqOjspeNEelX okqA3iBGWkzWUq3U8do2SzosTWxccRl9RgM9tmil+f46aO/yYKz9w0NORHIUZaA/v4JptPD3Owh H8DjPH3IGV9pzbEinmdsAd8gN+Q2i9uBVGPtzwC6rslZ0R4TcpHpSms/nviJjT/su3VBg1/5O7Y
 hoNiIwTnGc3ZDLXlmpZpEt+We7biftCUYqtLzU9EeEurfzZY15wBlRekz6JREV3ZLf8iZXdi
X-Proofpoint-ORIG-GUID: qw6JcQRNs-JZjEObp4nL76q0qLGhZ8uG
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=684c3299 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=POEnaWVzIgu9JzP7FmAA:9 a=zZCYzV9kfG8A:10 a=as4kufAtOCVNogPxCcYs:22

On 8 Jun 2025, eugene loh told this:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Our luck with this test has been quite good, but it sometimes fails
> to show its last lines of output.  That is, we send a USR1 to the
> trigger processes to set off the final output and we immediately
> cat the output files.  If there is any delay, the last output will
> be missing.
>
> Add a short delay so that the last output will be seen.

Unavoidable if it's structured this way, but if you hit them with a USR2
and caught USR2 and had that do the same output as USR1 and then exit(),
and did a wait(1) for both of them, you could avoid this delay.

-- 
NULL && (void)
