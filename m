Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B12E13F01A
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714131481; cv=fail; b=ZFGXbfkd4UFvwwnabc2yTq8mD/o4dnMYlSkgIXa3Ip0YMUzduuAgCt0Xrt/i4vAsI5cnf/K5EFNHNXZGchlDM+FeSM2EmWzhWc46gITUet/eWvEop02ad98tkARE2XMmV3xRLEzYmf/HrgY8dxxSZ6N+CcvFytUlwVRLQ0bsAaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714131481; c=relaxed/simple;
	bh=DF8ze+0B5l0ayZDJ8Yw+y1WtbDFrmQl+X7M8X0IH4xw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=jrihkHl/mjmA1zZkXyA3dI1tQN0xua9V+LRrtEBBuoSrLZEXGVpCz/q9NhankMN4yJAq2/nE1ZjZaGhBstWPTSM8cMBl37cPtNSxIwWOFp7PtRnScTDHcw6Mjr9HnJYCeoRFyaGMinzr5jHS0xU5+alDOVmI9b5xJE89FoBfLW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T3uFheBZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VRDqATYw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T3uFheBZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VRDqATYw"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q8Sqri025076
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2023-11-20;
 bh=af9eiz3rAFRAhbLd11VH/wCtNx1Jxrz/WIfM15pQTOk=;
 b=T3uFheBZ4IQKzyBiWRlK4HR5zwyefHspgQSSlcTrhBpP4tLGHKuaoVvSGttYjJ+zBY9L
 IRwSr2xsgCAgG/omeOeNvTIuroGKgkoGKAZENlEuzPgFxnUsKtV/tWzp4XFVx1PUTSRl
 3xKRyKoblQR2MSTr0PpfD/jEbKPTVQUMaYn9JJd+xlCEpcqXzS9IuWCW+Yil1RRszugW
 QaaXo79mbbPsI/I0+3/HuWyfXDO16uweKUFZ/MiZuFoy8tAZyZYeSmqNIRaF4eZbCXJM
 LqBjW9otzrATuRKa/VyVd4JKs9VdSa+JRi17B0UPNlZ2GvByGPAz2lr0y0xXLnd/lxrb dw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm4g4naky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:37:55 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43Q91DZE006126
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:37:55 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xm45bmhh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Apr 2024 11:37:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpFbQpPJO4Zq+MjTQjBnjHB+ODBZIQKn38cRrmzbZEE/Nc9DiuSxLRswnTJLTpqt/PHv1aJnl1t8TvWk9tFMu1TxOXgU+eVzUhRRIVBLuZkzIS1ICrIRNBKxhIflnFUz7Rj2yJz36ISaKZgU97tFoQADpTPU1jSqgQxx3LHGWP51wl5/NJadJTgIeaXtMRuwb7Z8qUUPqE7PXoeHpxNsPenRggYXz+tAGc43PmcbZ9fsgBN2CrLw8nyuBx5Vjti8dy/cuhvVUbue91F6KgPTiNUQVf+aEyxKDFHBpnhpDmqU6jQLg0KTv+lL+06hNIbkOt72/tj/Upo+0FqsKlEzSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af9eiz3rAFRAhbLd11VH/wCtNx1Jxrz/WIfM15pQTOk=;
 b=J11gmh6t6RkyspwdPor+L+esFg5U1ZuLXv9w3F6pCD5LoyMnR/aA0j4E8aFL//6NkA6MynT6fB3Q8dlvcPpcOa7e5oHtL6xXR22YzrKyio2BooufMDgUNSuP31XpSAPS41LIRs3S3f5j15gLR/8Hl4gHAA9EUQlXAjO0SecGvsJcAFg6M91CoRExQttCxO7djxZDVhlQEYkNqEckcx5ZzcQo4i5y8dofh+JJU509nOp8M6Zsmyf6Zf39Qw2A7Qm2sFIsMIUggIDDt59HJCL7eNe3gp+Yw2WAJFjdmBCkZGSGI0IcW+ycyPh3yZWGUbHMJ3HILd8Z2lU0naMAMH1f/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=af9eiz3rAFRAhbLd11VH/wCtNx1Jxrz/WIfM15pQTOk=;
 b=VRDqATYwBzg4qy8+Jej57zgkfSDiy9QsYfJpnIcvhubz8+ymUzKE8E297plxso4JUa5sHypTiFsbH+YSRs2Ji89LaPpbNeI/a6xDn8AMi1TAwCy+ifPIZgD8z7c3dKeR3uzmh87/KRc6ravqobk9ZPcilCrdkZxydu9zEllIRlQ=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by SA1PR10MB7738.namprd10.prod.outlook.com (2603:10b6:806:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.48; Fri, 26 Apr
 2024 11:37:51 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::67a4:9544:7249:7751]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::67a4:9544:7249:7751%7]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 11:37:51 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] bpf, btf: store BTF dict id for kernel modules
References: <202404252045.43PKjFQ9020523@pps.reinject>
Emacs: you'll understand when you're older, dear.
Date: Fri, 26 Apr 2024 12:37:48 +0100
In-Reply-To: <202404252045.43PKjFQ9020523@pps.reinject> (Kris Van Hees's
	message of "Thu, 25 Apr 2024 16:45:14 -0400")
Message-ID: <871q6smk1f.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0437.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::10) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|SA1PR10MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e9d583-359d-4207-cbbf-08dc65e54e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?px0qnR5E5iH+0NDbPjwjx5KFYpytHLvI3cr1qHe2fyKeR3UQHj1xYsqJ6t25?=
 =?us-ascii?Q?cUmlBu89AIfpuC+bNzYiDs9pEG1CyWKnbeDFHjmi84xE8y1+bR2C+hMZq+aE?=
 =?us-ascii?Q?c5WXKrf8nV61nZdTzf/3a06xXRQThIaWOyG20tRD6KrhIGiuvzkd/aD2BK7O?=
 =?us-ascii?Q?LMYY6dv7bk9/ihSInJ2s0uLWTKvDgmhu+KuU2byvm8fPt9dmy1ba9CTxIH7L?=
 =?us-ascii?Q?kHYDIpwy1eOvyZNSJFHPQGiJVcI2V5d2yWpfDHpyo+qzdcG/fJE6+on56QUX?=
 =?us-ascii?Q?cUesDbvL89yHVOhWETzH28iCd7mJB26YUPTcPpS1TWTo4iZ2KU4oCI+R+GnS?=
 =?us-ascii?Q?voKTsuEq4fWiXcyeuR+Sc8elvKvIAjFnyfWVqK9bXH2GNQFOwobKO5A3IItp?=
 =?us-ascii?Q?brAV0JI4kQjmeQpNNJFnNwMN7x6FVwuWErYkUyRL7abDa/+8c7oAgYWR/DiB?=
 =?us-ascii?Q?vD1Cpt820n81Yr1kWHqbE/q5Ojdbxk1sMpLIY3d1/jOlF85lgJ1w2JC0jxGa?=
 =?us-ascii?Q?2ZPi4p3DHRGTnViApAivzos9wOE0wmgq8C42oRLQTkBbRzYwxo24KUFBH/tP?=
 =?us-ascii?Q?5EIas8vdWO2DlkdxfFm5rPAy3LYsrAZYE0QtaiwHE++bTve1IAkROUJywBmH?=
 =?us-ascii?Q?tOcKylMSc//mApjbfgFXhF7NI4ysau46r2SqRteNRwNMyhf1iHjeeNwA+Ex5?=
 =?us-ascii?Q?qHwjiVWzajow0RXZMGg/Ph4FA3S9wkJNjo4kSpTTJV2fBDPFVyt/WMOhw6km?=
 =?us-ascii?Q?G6wWrLFK0VZJlOUgh8NK0sYxkvtwK++DT8p3bHGwBDSQ2HxrcXpcXef6wZ2d?=
 =?us-ascii?Q?RoNP7DhnwGpjrs6fmkZ11v7mbNk7khAKYCh2m1xyBv6OZlxBbBhitfwuSTsj?=
 =?us-ascii?Q?TfWdtVlP8WZFZNYCeMiV41z6qtnmnZNL5iCCECr+uS39XIe4Fwj5yyRUDm6n?=
 =?us-ascii?Q?K2EEv6E0MQ1wOLaHxUlwPylrzAUq6DeNyOl075+U9N9usG0kFH7g+7JA+EXc?=
 =?us-ascii?Q?lAY9E2oEFLgSgJfs9+wxdnaHp+ZTLeeYOCmGLlWfn7JIzfOpTNc4FfwNiYzj?=
 =?us-ascii?Q?Urc5h/JTUrSH+lubmooQeNyyzgsCTxLSwT4KQyONPigKsK9hJU301OA+mOh+?=
 =?us-ascii?Q?nT5pgarrxmQWpVmC8qg/KtW91tsmCkGBRR7nqNGYJa0yp8w7UKiLnr5t58Lh?=
 =?us-ascii?Q?cTzguWQcolr/V5DZd8y+ZbxdU63o8tQ06g5IAmchxh6m9fLRGN+kbiiltRgP?=
 =?us-ascii?Q?Jp2pGS2gzfM4lXm4tC0hCdwXvJMnGtvHYewMRlblzA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dYEeL1hEyZ+R3I66TRJCy+rLqzyipEZVZ30Hs9PoSFyImUQ422NCoKYKyI+e?=
 =?us-ascii?Q?u176IBLiH0LoYiMcY2BgLXNnYyehky/5fhqtX2gcQA7drSAEZrjuS+wtybYM?=
 =?us-ascii?Q?qpDu8fuZuE4WSJsAaTlPuI5h09VeEfzYOyGaUBNz8TL0gQEA4Z0V0Aa9dSlS?=
 =?us-ascii?Q?j9DVcMwpNFsXZvltSQ+0ZGu86Uxg2Vn1dy3ZYMPRg3yObXt6ESUQNEqVZE56?=
 =?us-ascii?Q?SMtuG72H0gx5vFbNmBMTs/69VXMfYuhVE3xk84Wn1+IDqslldJh0GzDUxu8d?=
 =?us-ascii?Q?FZudGq32T0MUJm8eArEhgim0xnCrbOzOE9eDWyfinJJcNEhsNiyxCrIK9ws4?=
 =?us-ascii?Q?UTvM/Z/4ZadmZyM98Q/w1N8WJ4VPZq0Z9JZTlYZvYNgY4uHq5RuFY7OiS0V7?=
 =?us-ascii?Q?PMTDKu22uvoCoCBXQBlxC0LvqWoMipZiyCNBLw6mzV26nr/moIx1O9mHcQ+E?=
 =?us-ascii?Q?OtU82/fZCCKHVD1319PpKD/Dxw/rAA0v42pz17X3eNT5GPd+QUcYTiPAOzkL?=
 =?us-ascii?Q?qZ2MnZK3JUPQZ1t5BLjntijWaALDYNM4AgRduC/k8G/3s33AIJe1Tw0AV72n?=
 =?us-ascii?Q?qZBQj0lh7ruwf2W19nvFPcfh89z7oCW9PXwNg6SD7V9XJrqa28S1sLM8JRhT?=
 =?us-ascii?Q?cX8TMEIhSibzik/C0EwQKsSLPXRjYVzDw0t7H5xYBs/TXK0alRpyEHgkoPxW?=
 =?us-ascii?Q?SJ0PoVJ3Bf6XAvRgZrXSBuuTBMuDzViIhKpCNGaXzvS6amtBpqGx24f+I2jg?=
 =?us-ascii?Q?Uvv1xMbJBZiq2aupc+9bBEbhiY9Jk3x/oZHwP8K+N5G2h2GVJ+weMLhOoA4c?=
 =?us-ascii?Q?NSr4KbfKRPK7nz0w/m0aw1/y1ifhMJAfgyTG8N6Op6lloijwOlnuiGRD861u?=
 =?us-ascii?Q?U3VkwA7ozJsYLchYGCltdPCsdPRyMirfP/GCgt9F2ebUWWOc7IUxG2refCr9?=
 =?us-ascii?Q?m4u7fLexBMFQ1m+MLZ/j6eq4V57EFXMaLnbHB7+myLVG9tWbbW029WeCwMmf?=
 =?us-ascii?Q?7WSyqBJwEJE/wofRJ/kguktPge9869vaC2keOFzS4XN/P7T1hYH5/NikWJnK?=
 =?us-ascii?Q?g9lqSVLatNofbwQAF7s8GU9hRPdCm4hk4O7iFdxh2uXD9dpdbn5QO6vCngxU?=
 =?us-ascii?Q?zsMEmObLYK+l/UkXe11kz69sEnPy4gCvZXJjchla1WIdo59kbYxMHLYa2z78?=
 =?us-ascii?Q?Is5OZIRVaZH6v+6ClgdGuecfzYXCkCg5Cm2rZIXbvpmgqk/kVIxAIq6l2jbY?=
 =?us-ascii?Q?cRq1pumiUdtD4ydzIoNSjiG86Y/03ButbwDYEY4EVpHtsWsQ+QgNIyoaLnr7?=
 =?us-ascii?Q?Qa2D5QqzmvELRyeIYQo5du4T3CEhHgNHCwYo02YXN+sTaob9ToFlL51G+WwT?=
 =?us-ascii?Q?ss4ey43rU8UVdoULtSKTE4NHMZ92TaTpTLNb5gV38vk0FtVrVkJ/9baj9qLY?=
 =?us-ascii?Q?td3+GSV8o53BvjkBjjZ3vo7B6qD2b7HWnQMLb98gBTBdqQJJ6n4LRK0o5JDA?=
 =?us-ascii?Q?0bUpRtfayJTxh3D0p9DRRFzPWIGIqYJSeaTcdkc8cjx5C2Uj7OXfbwWonOgF?=
 =?us-ascii?Q?24LtZTtrZREat4VsXTKvcpm/BQIbZpUXYERCtGvpkatrir3L52NS528MzMJ3?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	F1J3XyuQXDdMX3u3V+MGH1QNrNapJ2YE4iJwZ7HO0NdyX5dWyivJt+YqCmBKCTz5rI42x00IttNp7VHP8vBlJmrF2y9/LwhF/M8fpXKmwIjca6/d4Y7HTUemQ9YCBVfcf5BYs9fJhDVUaK639NjhxKIj4I5UYDKlGO+z9aCQby0Fs5z5uQnRMIFZsYBCM2O4Ua9WjaxvUsLr9Cwf433OeqPDbGqY+zTxUgrwCmcd+wZTLSy312Tba3r8lMA8adV5U/D3nh8BXj5C4O3nqfafHkDLaquHILGXmISz/bpZRJKIXK/uLbalxQVCz0Ra6Alu3MHdlU8qeC8N2LdXqns2albdxA4ibuoa9tbDddUFIcJIwMUKFTpqgGLr7AE35uxO97r851/9MjM16LkGUxRHLmSoH5MpyUQa21flZvR1YmqTqt2Uhyr7xY6WjuGfCHQKOpQArFY6FwVxXJpm0QqEklI7+d5aKV0RIxQtlwWpN+SZQB0dGt5vE4Q/pwdpM9h3wl/1KZQ5qA1kPicbH66dMb1qTvdZAolSpkafNXWLl2+Mlrimejy8INNpmvgC8jWc/NCL96EI/og8pzFAbFF2XrlJlm1r8Rl9ZFoS4Mjt1+4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e9d583-359d-4207-cbbf-08dc65e54e53
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 11:37:51.8031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APkRrVVs+xW0kO4sG8l4XgK3E6RYOc/MzNOvX1LA5xikjLoxdBeqJvgZq25ap8UecC3r5T4PlMSW1YQgCIwTTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7738
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404260076
X-Proofpoint-GUID: _YXvvHMwCDMPv8RosWoonidI43N8b6EW
X-Proofpoint-ORIG-GUID: _YXvvHMwCDMPv8RosWoonidI43N8b6EW

On 25 Apr 2024, Kris Van Hees said:

> BPF requires a file descriptor (provided by the kernel) to be associated
> with BTF type ids for loadble kernel modules.  This file descriptor can

s/loadble/loadable/

> only be obtained from the kernel based on a BTF dict id for the module,
> and these ids are assigned dynamically at runtime when modules are
> loaded.

... were they *trying* to make this unnecessarily painful to use?

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

with a few niggles

> diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
> index 0146386b..60256f12 100644
> --- a/libdtrace/dt_btf.h
> +++ b/libdtrace/dt_btf.h
> @@ -15,7 +15,8 @@
>  extern "C" {
>  #endif
>  
> -typedef struct dt_btf	dt_btf_t;
> +typedef struct dt_btf		dt_btf_t;
> +typedef struct bpf_btf_info	btf_info_t;

This sort of thing will start throwing compiler errors whenever any user
#includes the header that gives the concrete definition of any of those
types, because we're probably typedeffing them there too, and unlike
struct definitions you cannot repeat typedefs.

(Not a problem now, but just noting that this sort of pattern tends to
store up trouble for the future.)

> @@ -339,6 +340,8 @@ struct dtrace_hdl {
>  	char *dt_ctfa_path;	/* path to vmlinux.ctfa */
>  	ctf_archive_t *dt_ctfa; /* ctf archive for the entire kernel tree */
>  	struct dt_btf *dt_shared_btf; /* BTF data for the kernel (shared) */
> +	int dt_btf_cnt;		/* BTF id count */
> +	int *dt_btf_fds;	/* BTF id-to-fd mapping */
>  	ctf_file_t *dt_shared_ctf; /* Handle to the shared CTF */
>  	dt_htab_t *dt_kernpaths; /* hash table of dt_kern_path_t's */
>  	dt_module_t *dt_exec;	/* pointer to executable module */

These don't seem to be used anywhere in this patch: did you swap between
storing globally and storing per-module?

-- 
NULL && (void)
