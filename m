Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8882149006
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524722; cv=fail; b=pQyoX4EfvhbUbHDYJkd0ZoBb6S3dLZkM0XnvRZeWVF4G+TIIocX1PAfFvafIGPL+zHzak7AnWkJK4VKNXt2paqyCAo7LuB2BXrMbRc9rOboVqv57+XiVoqLfHNYZy+kF/BKozUD6U5a+qWftr2+ZTVxaH+GAXZPdCJ8un9S3pwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524722; c=relaxed/simple;
	bh=r0Ki3Or1FEOAklT3kx2j/2rPqr8I4HTXiy+j9yTpX0A=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f1DvqlNO+4uMq8uGrb4luICrb50hYTxxEOn8RqMRQGWN/yzueccxRq9UBn6y0BHZM1qPtUE/WuEcbsfFvIvl0fyiURKpRP9KGGTmCeA2O1MaNxmcceuT6/X9e3ZdVDoKvqPo7kuMZecHMig8CNMw/SJ3xnvXwQ4YotqVxlEGAHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BnST4026512
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:12:00 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3DZaVV8Mxe/o17nK9?=
 =?UTF-8?Q?VCWlmWlHCL9SMX6nHmpmHDKhvFWQ=3D;_b=3DcvFYHCq2us5xP+w/U5JSFBPv5y?=
 =?UTF-8?Q?AMwprCvLX/qJupmsr0U0HCf3VX+VGXm0rxQ18Hmhud_4MdqcJGRc2hNzHrOTe4w?=
 =?UTF-8?Q?4omlaUyM0ptPaTJAwut725ZXpNG+6i4Od+sCdeJT1pCJTzst_qoFV8oRCXqkKlv?=
 =?UTF-8?Q?qSsUC0yxI9HGNc5OxLkxkq9VDQlf9mA2/NPBWxFVKPFzQeCdOAP2sl_yXZTm/YX?=
 =?UTF-8?Q?acVt2efSx0AEDNmYrSVLC44LtlNKBbE4h1aIn2uxfx2KRslLcliFpK3w1eFm_S8?=
 =?UTF-8?Q?A6Qr9r1j1DxXQROsUMkYQcD1fLOJJYchWW6JHnrujzR8C4hk6FER8d6QYYWqt5r?=
 =?UTF-8?Q?L+i_iw=3D=3D_?=
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv07wmuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:59 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HtMhm020558
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:59 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrj2cpnp-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PG3MXKY2pLtXct3nFCnz22V497Kg9bMBWR07w8jeTWYziE2VpBXCrXt4d7zN61CxVTiWCVLOT0RvmLnhivojPLtwIQ5h0PKWixmR5xnQvX89Up3DUHzPGauObFvsfpQ/EK8cHsNh3U81IF8I893sSFGvgMvapJ12St1AdWin947ZlDDrzyYqIkfQFwLzuKdcezbb5CJyETkgWabMINhpulNu6DwSCXRT4DF0FGYSqJd7GwlcuHxT9Qf4k2r9lzqYdSgYU5rwt9worzun9l31ZkRuX1l1L0XfXGGpSoIssfn0fNiBWoqVxA+gcGqj0XUcPY/kd7CHkBv4VpTllvUvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaVV8Mxe/o17nK9VCWlmWlHCL9SMX6nHmpmHDKhvFWQ=;
 b=EN9hPXZK4VNHc4idzI9uDcLbWUh7CryxAFbZmujW358QOiFofNazEPwEXYGL4NH2F4b4THutprqYqENbC6L6Kin4W8AVehwbWGB5B3oz0Hk96GK1gew5lD+g0g+FEB80FC7UXQgn4PsuMxk0uuRkMEjwL5tUNOtr5wdDunogjtuptI4DYxUm9MK3FRDI9W1yQOtQdzT4kJ93pPgkzEGyYf2hVK9xFBWunmq+VhTyzS1Jq+wI3aPGoErsSuZzoRgsauRtaG/aASqxKNgScvpL/j0nbatIBEY3QWQvpwWEkUOCfYLOc4CCfmSo8YdLS8946Wx4qizxN8/Rd7oJxAurzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaVV8Mxe/o17nK9VCWlmWlHCL9SMX6nHmpmHDKhvFWQ=;
 b=PQQbmrQ7xqPm6UqRmWFyyHD/VhU2rtrIuDcefZxkayIca+wA6XcJFACv4oFNGMChYEiLCRhW4NAYhMvXfjxQtoRALO1S5bWVSs9v7cuL8keigJwmyR74cKDiEat+/OjHND+7CgfR1ImIP1EL6khPzm/Rfx2w2cPHnBAYrZwmAvE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:11:55 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:11:55 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 09/14] Systemwide USDT WIP
Date: Tue,  4 Jun 2024 14:11:08 -0400
Message-Id: <20240604181113.11505-10-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604181113.11505-1-eugene.loh@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e05d8fa-121c-42c1-ad1b-08dc84c1d018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uXdsBMo5CspphYD5J+qmEuxGHs+vCRep8QjstbJ5QZpuYDQihAx4oWBneD+7?=
 =?us-ascii?Q?KY1/7an3sUZmeec45exXswetc3vc1KT5rtohpwDsdE+kqQ84PJNgp+E+CTgJ?=
 =?us-ascii?Q?LQSoQ6u3yTscDoxedp2Ic292Tt75LM861WcBI+e70OINWFLUCc3RNTIcpnH6?=
 =?us-ascii?Q?aoREP95aBxJwyovjdppSSvlRTeBn2GMW4zyOKDS4SBg9VRhu0b9T8Muu1dIf?=
 =?us-ascii?Q?dJw2cIck5/nZ66LXBpltUNJgUD9utT2NpqzSmrBbsBIA6UsPiY3rkhyCe5Ax?=
 =?us-ascii?Q?bsrq9ULUW0YSDYZp4nUHeG4cYBBnNdiVz1E1H7+9sWc9xfG04TcevkE2Ey6m?=
 =?us-ascii?Q?xE/7gRnisioMtL2B4OlI/DGban2L3EsGZK5lUXsaqJCiKzONrBf5aphMMqbB?=
 =?us-ascii?Q?j6VcMfNKXrosrgOGwd6dzUpArChL8lQMBm2IPNBZpGIf2eIAVNO7z+nJkQX/?=
 =?us-ascii?Q?910yQgjbawB+uep6QBOReWJU0xBpO+ajDoOU8+mvAMPR5tbVFid+USNPz4yK?=
 =?us-ascii?Q?BAI8l7E9/S8alE+ngwgMx6xCSukItpoTxz2cRcCVbkS0wwl+cNtisqVQJSg1?=
 =?us-ascii?Q?Tdy+xj5VtWu3cNzcAw8D27aM7bWRLLL0tDGuEw6YKVy3L4tVzhVgynY11Vne?=
 =?us-ascii?Q?uixPSpy3NJfbgOzNW6kjc4+py4/N4FGL16h4FacdvS5fVG6FXUEHxcFQz0MM?=
 =?us-ascii?Q?MnLuyUq9xhjmlJR1p4hNKpdRzojXhghME1KhL0XWqPaNgRoOItJ2yqn7o1dX?=
 =?us-ascii?Q?6n9ffoS5QocZEoIUQROwFWUmH8VWR9k8cJwq1/UrUToDo87zaMKVpg4BVWFb?=
 =?us-ascii?Q?EGqDdaW/YprewCWBMSzRcSNdeDLzk9HrDwWXgF9ZfEqDMmsmwMjjbF4XyzQN?=
 =?us-ascii?Q?aeYab9FR0BMzfF31HI8n1Oznph9hLIKrX/QK1s+5h/i2mZKKd6EVow2jJEhF?=
 =?us-ascii?Q?VeACmf7+2DmR9+A/q3/1B6gWc+WNILvcA6ntJm8DACujvwuNFvRKUeC25F7o?=
 =?us-ascii?Q?8oTAD1lLmyQbZ1YiNkhxks2VG8qiXQRzmRTPn7ClTaZvodDNOkAkp7tlkz5R?=
 =?us-ascii?Q?2NB/c11FhZ4OO6l5CUTPDEK+1f9i+nl2Y4PFpyfX4qoGcNuGac+H4jFxgf+e?=
 =?us-ascii?Q?7B+1qcSIxXspRydVMuQ1Za6c/7cqozrBAIOth6B8cOXPcOzBjKs2w3TdlGPj?=
 =?us-ascii?Q?YIcPawpsWo5I5ySqMbOIsK4SqpsEg/Z3E8JFZ9ro2lUYlMYFG6D2nAXdRuy5?=
 =?us-ascii?Q?bvu5y77jAod6T5LsG/RDdy7ocmo3bW4a/GGGfhIjxg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WIyLzcSiicOQ6sKo+7iBMtw+eiVf6daBskegrA5PbVET0YEjlnjc0jFJkTkW?=
 =?us-ascii?Q?2L/btgwHA/srHMCgnNihLdPC28M6SuaV03b5YyaBXuIN4b9VOonGqiZ4UOL0?=
 =?us-ascii?Q?bK1eSdJTT/cVnysUfqeGkOYAeuB4LvVS7h71abrBH6KnpFFWy2pbZgIA6Mb5?=
 =?us-ascii?Q?1EQnsklZeTK6eYulAsDkb00s3pDoUy1L552Je8XoP42ZfSKJE3/omK6ZDwer?=
 =?us-ascii?Q?rrqXpr5tzIZ/M+m9zwivhuAz+JZ3Cxl+rnEx1ak0l8/Nq01PEHaXDjRXAthC?=
 =?us-ascii?Q?EjO339z8Yz8B+Pc5x0l06KC753AIC7ocHGJdH8RiH3jP3fZ63XXgoMaS67Vm?=
 =?us-ascii?Q?MOY1dDHTk55rDA8YoQnZGn6Y0/2dDteLJX2DwW454+xVD1zGqfntwP9R3cWA?=
 =?us-ascii?Q?lpVZKaGC4j7UOz0B03f4FKnELVNYzBqsjcz/aP6R3BFW9whO8m6ZObX/x/SB?=
 =?us-ascii?Q?8GCw6l6btscn1KJCAR9nzdAU68/nygbZqGxFyARF8bhZqvdRiBSB0jXFqF53?=
 =?us-ascii?Q?bxilCb90rzVfRod4MaQXIXkKf9WUyIL1K9jcOZSAuCavV3dv5knAuXxUF0tz?=
 =?us-ascii?Q?PnLO5X1xEYjgnu3wAz6aYYBKmQYFBmuLrWwdwm5YDFarx33Uv77Ze3YDoxgm?=
 =?us-ascii?Q?jg/+84kYHm2VtLvUrTGR/MCffdwVjVckKUlZXpZ7+7O2H+uj4CH1VNGcbj1L?=
 =?us-ascii?Q?lEwNcurBT634a03XNW5g3K4GLv6YsvZQjHaJtoxUWTGBXKazDSKbD9VKMtLf?=
 =?us-ascii?Q?oaiobH3zb1KtCr/AraqrmAZzsKLOVN0MK+Oiw/Z33jrpa2QaI79ttGih/yDt?=
 =?us-ascii?Q?1vVEtF6svgSLT3vFUur54qNHkICSpEvgHaQp/oVvPJ19a9B9Clr0I3ZbooOP?=
 =?us-ascii?Q?7oh5+t8FQa6/weEe28eFqgQql5n/Tl4OuBkjOGkfnehjL7Kd6KMITo0ua3UO?=
 =?us-ascii?Q?pVOyvnYtGXyY4hTdCWXCP7NJNBRdR5cS30KhbIcFXRWuVzsm8sJHCHMG7U4E?=
 =?us-ascii?Q?SfVVEebfzG37Jc2yx+KISChko0LWVMV2SVpOmYbnepG0KwjG7Rxpc9Q9OkOO?=
 =?us-ascii?Q?ZnfX+wy7V97vNcAxj/S3Az4ptXy3u7CEuXTOGzmaqVSq00COg0XwG5kqCVk2?=
 =?us-ascii?Q?pn85AdlwyaYF3GbDQ/ptWJ+qinlIKafA+olz2w+zEpiHVSic2furKDnPwmhu?=
 =?us-ascii?Q?uVdOpG6hBmFJ/AJZgpj+koH8yx5LVeClFpATR5/VzNMjX/xlo3yFBamfIRiv?=
 =?us-ascii?Q?Z3RsZ3hYdjQR5mtNUfsAIsys7LzlwNCOmiIB05TFDSxYUEIuWvXJKGG8tTLl?=
 =?us-ascii?Q?wFqtSrNfA9ncIGXwxlhocEjt3iwtxs/1Sq7ElJe1mv3H3Syw2ZVkRgjhDkso?=
 =?us-ascii?Q?lb86HHHUnKgLnfxM50S0L1N11QBMpwuxoH/OGUmXr+uJV3HAXUzTk2sB+O0X?=
 =?us-ascii?Q?ThG8yVMU9mWNyjLd3XTKPhM+mtUuilCnSt01spOqTgxa73Py1NgQWmywGKPh?=
 =?us-ascii?Q?jVp0/IKctq6YdUwWeE+FFEXepkrZWvM29GAtVF3LFS0+aB3gcL5NoVZb8hfn?=
 =?us-ascii?Q?4Z10OYLUwso56iEAbNDUnwiBrr9HCxgQzBRm61nQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	a0ZBWpX/Npx0hP2eTfJ9pcbg7OBAAlP9i7fVO8mVzcL9Mz/uwbCGW8b/4ntLFLbdqvGuLNO+P6TvmIStnZ8Qs/sX/f6vMPdvLIUGrOioiZTxbMlyZl4uobkjPsq0KNqC8w1HUzffWh1jQUbIYqsvJWaDwl0RaMWTQQy82glToQ2IM2Nz/uMAbKWnlEwIW765W2c/JvAZUxwKG+MA4ubDPXGEYwYXYRDbFP7+cPiEPFfvu7WPafb1ZMpzXTdxFJWsWEb4DSo1T97Gz/p2iyyKQbxweg5xSiPiG86wiDBMH8ef3X1dQl1VRbr3E3ECv56JWo/v+ai4Xf8pe3UdlYfy8gInjNkhuVxRDbYtpazWzbIc9C+m2iBFkpP0d7tLoqx/i4FijrdrmHMr/fK5TYEkxgEb/AtzkgGxTnFwfL7htIH4EF//D9Hpy/nTkpEzTwurfPR/awfOmS0mUY3lFVlqh3Q5rv3NhG/1OTmdctYk0ahXTI1In8Rk2vDywTigIdVp/0xjGeqdwy/syfMHgi+eFf1GA+gLP834r4tK33/pFnkY/E8wIKKtKnkhd+O3emaSjE9wfvok3jHsqDvPFD185D5M7wIghHJTxmeifTxX2T4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e05d8fa-121c-42c1-ad1b-08dc84c1d018
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:11:53.9655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvgcHxmcGZFccB3hK6xBhQpbsoolLSqbf5NMDzy+sGVbQIcA7RDyyozHQyX/s4V6nXCiqrADWw06FhI1wOKNDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040146
X-Proofpoint-GUID: P-p7OPLdKjTvhjtG1836dSHVtqSiC_Ie
X-Proofpoint-ORIG-GUID: P-p7OPLdKjTvhjtG1836dSHVtqSiC_Ie

From: Eugene Loh <eugene.loh@oracle.com>

need to:
- review tests
- add process monitoring
- deal with FIXMEs

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cc.c                             |   3 +-
 libdtrace/dt_pid.c                            | 136 +++++++++++++++---
 libdtrace/dt_prov_uprobe.c                    |   1 +
 .../dtrace-util/tst.ListProbesNameUSDT.sh     |   1 -
 .../dtrace-util/tst.ListProbesProviderUSDT.sh |   1 -
 5 files changed, 122 insertions(+), 20 deletions(-)

diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 6bff7e0f..eddf8252 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -279,7 +279,8 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 	 * and tag -- we just have to longjmp() out of here.
 	 */
 	if (pdp->prv && pdp->prv[0] &&
-	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
+	    (isdigit(pdp->prv[strlen(pdp->prv) - 1]) ||
+	             pdp->prv[strlen(pdp->prv) - 1] == '*') &&
 	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
 	     pvp->pv_flags & DT_PROVIDER_PID) &&
 	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0) {
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 93a7ce76..e07a3a4b 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -780,8 +780,8 @@ validate_dof_record(const char *path, const dof_parsed_t *parsed,
 /*
  * Create underlying probes relating to the probespec passed on input.
  *
- * If dpr is set, just set up probes relating to mappings found in that one
- * process.  (dpr must in this case be locked.)
+ * dpr must be set and locked.  Just set up probes relating to mappings found
+ * in this one process.
  *
  * Return 0 on success or -1 on error.  (Failure to create specific underlying
  * probes is not an error.)
@@ -795,9 +795,6 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
 	char *probepath = NULL;
 	glob_t probeglob = {0};
 
-	/*
-	 * Systemwide probing: not yet implemented.
-	 */
 	assert(dpr != NULL && dpr->dpr_proc);
 	assert(MUTEX_HELD(&dpr->dpr_lock));
 
@@ -1104,22 +1101,96 @@ dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
 	return pid;
 }
 
+static char *
+convert_pidglob(char *s)       // FIXME expect const char *?
+{
+	/*
+	 * Convert a glob for "pid[1-9][0-9]*" into one for just the numerical
+	 * portion.  It will always be a subset of the input string.  A NULL
+	 * pointer is returned if there is no such string -- e.g., if the input
+	 * string is "foo1234".
+	 *
+	 * There is no need to check the entire string for legality.  E.g., if
+	 * the input string is "pid*q*", we can simply return "*q*".  Then, this
+	 * string will not match any "[1-9][0-9]*";  we do not need to intervene.
+	 */
+	char	*p;
+	int	nchars = 0;	/* number of chars of "pid" we have seen so far */
+
+	for (p = s; ; p++) {
+		switch (*p) {
+// FIXME:  I think this passes stuff like "pd1234", "id1234" etc.  So make sure 'p' 'i' and 'd' are hit or else there is a '*' to jump over them.
+		case 'p':
+			if (nchars > 0)
+				return NULL;
+			nchars = 1;
+			break;
+		case 'i':
+			if (nchars > 1)
+				return NULL;
+			nchars = 2;
+			break;
+		case 'd':
+			if (nchars > 2)
+				return NULL;
+			nchars = 3;
+			break;
+		case '*':
+			break;
+		case '\0':
+			if (p == s)
+				return NULL;
+			if (*(p - 1) != '*')
+				return p;
+			return p - 1;
+		default:
+			if (*p < '0' || *p > '9')
+				return NULL;
+			if (p == s)
+				return NULL;
+			if (*(p - 1) != '*')
+				return p;
+			return p - 1;
+		}
+	}
+}
+
 int
 dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 {
-	char provname[DTRACE_PROVNAMELEN];
 	dt_proc_t *dpr;
 	pid_t pid;
-	int err = 0;
+	int err = 0, i, nmatches = 0;
+	glob_t globbuf;
+	char globpat[256];             // FIXME hardwired size
 
 	assert(pcb != NULL);
 
-	if ((pid = dt_pid_get_pid(pdp, dtp, pcb, NULL)) == -1)
+	/* Exclude pid0 from being specifically requested. */
+	if (strcmp(pdp->prv, "pid0") == 0) {
+		dt_pid_error(dtp, pcb, NULL, D_PROC_BADPID,
+			     "pid0 does not contain a valid pid");
 		return -1;
+	}
+
+	/*
+	 * Try pid probes.
+	 */
+	sprintf(globpat, "/proc/%s/map_files", convert_pidglob(pdp->prv));
+	nmatches = glob(globpat, 0, NULL, &globbuf) ? 0 : globbuf.gl_pathc;
+	for (i = 0; i < nmatches; i++) {
+		if (strncmp(globbuf.gl_pathv[i], "/proc/self", 10) == 0)
+			continue;
 
-	snprintf(provname, sizeof(provname), "pid%d", (int)pid);
+		pid = strtol(globbuf.gl_pathv[i] + strlen("/proc/"), NULL, 10);    // FIXME need error checking or anything?
+
+#if 1
+		// FIXME: omit this check?
+		char provname[DTRACE_PROVNAMELEN];
+		snprintf(provname, sizeof(provname), "pid%d", (int)pid);
+		assert(gmatch(provname, pdp->prv) != 0);
+#endif
 
-	if (gmatch(provname, pdp->prv) != 0) {
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
 			    "failed to grab process %d", (int)pid);
@@ -1129,14 +1200,45 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 		dpr = dt_proc_lookup(dtp, pid);
 		assert(dpr != NULL);
 
-		err = dt_pid_create_pid_probes(pdp, dtp, pcb, dpr);
+		// FIXME handle err better
+		err = dt_pid_create_pid_probes(pdp, dtp, pcb, dpr);        // FIXME rename to dt_pid_create_pid_probe()?
 		dt_proc_release_unlock(dtp, pid);
 	}
+	globfree(&globbuf);
 
 	/*
-	 * If it's not strictly a pid provider, we might match a USDT provider.
+	 * Try USDT probes.
 	 */
-	if (strcmp(provname, pdp->prv) != 0) {
+	sprintf(globpat, "%s/probes/*/%s/%s/%s/%s", dtp->dt_dofstash_path,
+		pdp->prv,
+		pdp->mod[0] == '\0' ? "*" : pdp->mod,
+		pdp->fun[0] == '\0' ? "*" : pdp->fun,
+		pdp->prb[0] == '\0' ? "*" : pdp->prb);
+	nmatches = glob(globpat, 0, NULL, &globbuf) ? 0 : globbuf.gl_pathc;
+
+	for (i = 0; i < nmatches; i++) {
+		char *s = strdup(globbuf.gl_pathv[i] + strlen(dtp->dt_dofstash_path) + strlen("/probes/"));
+		// FIXME: do we really need to strdup/free this, or can modify in-place?
+		char *p = strchr(s, '/'), *q;
+		char nullchar = '\0';
+		dtrace_probedesc_t pdptmp;
+
+		*p = '\0';
+		p++;
+		q = strchr(p, '/');
+		*q = '\0'; q++;
+// FIXME should also check dof_version, though that doesn't do much yet
+		pid = atoll(s);
+
+		// Check, since dtprobed takes a while to clean up dead processes.
+		if (!Pexists(pid))
+			continue;
+
+		pdptmp.prv = p;
+		pdptmp.mod = &nullchar; pdptmp.mod = q; q = strchr(q, '/'); *q = '\0'; q++;
+		pdptmp.fun = &nullchar; pdptmp.fun = q; q = strchr(q, '/'); *q = '\0'; q++;
+		pdptmp.prb = &nullchar; pdptmp.prb = q;
+
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
 				      DTRACE_PROC_SHORTLIVED) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
@@ -1147,17 +1249,17 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 		dpr = dt_proc_lookup(dtp, pid);
 		assert(dpr != NULL);
 
-		err = dt_pid_create_usdt_probes(dtp, dpr, pdp, pcb);
+		err = dt_pid_create_usdt_probes(dtp, dpr, &pdptmp, pcb);  // FIXME: we care about not just the last err
 
 		/*
 		 * Put the module name in its canonical form.
 		 */
-		dt_pid_fix_mod(NULL, pdp, dtp, dpr->dpr_pid);
+		dt_pid_fix_mod(NULL, &pdptmp, dtp, dpr->dpr_pid);
 
 		dt_proc_release_unlock(dtp, pid);
+		free(s);
 	}
-
-	/* (USDT systemwide probing goes here.)  */
+	globfree(&globbuf);
 
 	return err ? -1 : 0;
 }
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index cb79e0a3..618219b8 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -766,6 +766,7 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, pid, lbl_assign));
 	}
 	emit(dlp,  BPF_JUMP(lbl_exit));
+
 	copyout_val(pcb, lbl_assign, 1, 0);
 
 	dt_cg_tramp_return(pcb);
diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
index c5dfc72b..9d8f06e9 100755
--- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
index 644da2ac..6eae82ed 100755
--- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
-- 
2.18.4

