Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31170187F
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716489702; cv=fail; b=Z3XInUeUVpye/E+fiG1WS3h9NmWZDxttstd+If/dM1RrSCfoR/0+6Yw6CwjDwwtnDy81DrdYXeHFvwkDLDdws1oV4hNNS4cw2fnQ2a1ipC/tfsHjIZuk4GriucSyJfxr+TWbCOxZ7E9d63Pv9iyk6/zY2DLxsk3yL1QUGtiOftc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716489702; c=relaxed/simple;
	bh=3RhriH7M6bIhkXJgBnGD2yWQ3nxQ9pelfkJ0IK/cX24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NJ88HYIg383es/a9CHt/vkrlLj6OtqHW/WxoXdkSEx+W9X73fqgslydnC38IsYLo01xlBu3k5ssPTn3kOtO3X1wBM0ufYuHSjGOzBytzKPGFcaRageiZMl4DRF+O/7gPxj7YhJjJj6cowlLshJs7vLoT+kJ3wP+CJ2LFI//QApw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CxSIT1rV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=o511pUj9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CxSIT1rV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="o511pUj9"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NI7jF7006745
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-11-20;
 bh=4YerlA5D5CdybhNrUSUTT4AeRm+Za4ItzbAXkJfPd/4=;
 b=CxSIT1rVefHZumOOxQnbUcwKVHpQBVTGq1OpAH45oLqv1LMi8UGdQuakX4Rq6af9isd5
 Pi9yU9wFejGYYn4CxuBRvj6FU3CDkIg92jF5w4p/C+vIDjfV2fw9ajD7zEf8H+N48PjM
 Dz9pBPaDODzSuQbZi81pUnqIT31PullFNpR2BCRuw1srYLXKiShOq67UGVLWZd/OVKxa
 e8gG4O1+DQuRpliSAt7rDhYS+aql2laZnxnROQPApBEOli13goXBVfcZ8xCPFLim3L/Z
 5J3SeDsOEt0eCuj0Q7FclTqZO9Im9Q0HnJV53oy/3ZdxuPhJobpH3+QdxBj+q9/U/eu+ kA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6mvvavtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:41:39 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44NHU1wl004951
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:41:38 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jsbbk1e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:41:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eb/5Op2X1qcJOGiUfiW3pJ+SvaVUwBdl8JbK5JW+ncdRrRhWKJ7E0u5VIKuXJlRgRliRUlCt2VeVJT6Y4dG8anLtNnN0ZMzJ5/FF9noay3p4+c5NxSasbAHsyVHO8ZaJY8i6ND5gAyvUiDaoyGYKl8XNw1oItEZuPirCklUoSXs4jR35HfaAs3KLkfBvh1CxV6z1qN4L+aBwMPO+ibKCxf4o+LM8Zp5zRH9GdBoPB+R2bY6peEuWFD/AGjbgTXzlmDpCsxHIZjb2LiLGZR54Q3W4p488J/qzyp2w63p1ijZdUTVCMWmYc7ap90FqCLrseDrikElD41Ziv3T8Ln6Nmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YerlA5D5CdybhNrUSUTT4AeRm+Za4ItzbAXkJfPd/4=;
 b=U33lbehFwctlNGZT8+ZmM4Kpv4mw18gxrvuWkzyFDnFiVvOtnZyyBgJf/ChhdoLTXmNLOz45AefMuEj95rXi6tfcIvmJePvfGyxGWiqtoHJsy0C+Q9TL47un6P2vYuANPmMgk+NvkcVmEAqHN4xPnhtA/Y0Zh3/XyisWz9inesnIuMAE5JCMtL5f48GbaAOid9+Rk6c3ozM/kOLI+ZTPs47i5qksAgx06ANFjzgIIsXGPlgqz1Z3Aa0yFlVTwjC3IrCtV5KG5ZkTUcY7L6ZDAM9x7tu7M6ugzNbs3HhNMK3P/6WbT8DaZT7vLkeNRmD9mf+1rUmmfdXdU+S+8MjYzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YerlA5D5CdybhNrUSUTT4AeRm+Za4ItzbAXkJfPd/4=;
 b=o511pUj9nNV/VJv9xxOkUpe2wCbW7GB1g8QQLLwIPYofVAr3ovKr25c7ZSE7UpxGKh0B7nTnu9lkOfflEgwg9XBZq3iCoiLGJclg6y38swLBlHZztwNSTT6yRTPYZahqpgktqvi6DoqG+qWn5sGVBQljp7nremTfdepeB8FRkro=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH2PR10MB4166.namprd10.prod.outlook.com (2603:10b6:610:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 18:41:35 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 18:41:35 +0000
Date: Thu, 23 May 2024 14:41:32 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] build: install sdt*.h in /usr/lib64/dtrace/include/sys
Message-ID: <Zk+N3P7NnwzL1ZSz@oracle.com>
References: <20240523175654.462908-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523175654.462908-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BY5PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::36) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH2PR10MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: 1808efb6-3fe4-4d45-aed1-08dc7b57f950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rk3IVG+Dc31fv7S7eLLWlzqJ9uH5VynCf2jlaM9a8IcHiNbMFoXE3Eb7vxTw?=
 =?us-ascii?Q?TW9DBEllYbT+DglVLH1qC6U3+3nL6GaUJ3y7DoUr+oL05fG8LB8uE+e43U6+?=
 =?us-ascii?Q?YyJRaXdcBgHBgubku8MJZ4KVm41bwTg65KSK6TQnWp2UgxA7NVRoE+vHNP25?=
 =?us-ascii?Q?4a6erkqpx3h2mpA8LPm178gIMXSqqWLOc61DiZ1DJry/cA/uYiSittj9GXet?=
 =?us-ascii?Q?ikBqJAxc4VcFgXFQqIDJ4FH1LXaZ2VFZZ3KMCZ4mhthVpmt7K1u5cvmv7zJg?=
 =?us-ascii?Q?Zn5G9Dmd4IqePpooITGTrCXvkaVQDXc6HubUb4wXkTxtuqxrw0PxSzd07n9R?=
 =?us-ascii?Q?ObgPtrm6ZlI9Wm3XiYK0gFQRe4gjRkIHbbxnns9uvm4/md4qDvxWCoAAYtHA?=
 =?us-ascii?Q?jKbXKeiu+pcV6Lv3sbXszFMxCiUABva3LQU4cP5bm5ZSqHeoZ3qka5n6qRGJ?=
 =?us-ascii?Q?sw8CyEyM1bAVkuzKDoNQlQx2gMewgLn287ixoTPUmKrQVzqQBRolhSGRGTVm?=
 =?us-ascii?Q?GPtbWCK99qNbo1v+eL5axrZjLfhoVgx2vnduLSf7dexH2WMdGT0AGWUi2KCW?=
 =?us-ascii?Q?QTHqod9eW5l88jKnB3GKp3Z2zTcBailZEFsO+MEPAS9QjUtH90+O5Wg7sKWs?=
 =?us-ascii?Q?y/pFqc3Isz5zRMlSsMFNL8AQFIp7uTuoCT9pRyCbjqTqMBGASCFxd1FLUtLF?=
 =?us-ascii?Q?sBMdEMWe7HztcpTvkqenlQT5uq550On9cu9X0NtdDquq7RxeavKFfvlc+I8Z?=
 =?us-ascii?Q?oKlqJG+SqCTBKXqdndHc59sd8pSdVc9xl4gqhoIUcLJD4XT9tqKxRop1SAS0?=
 =?us-ascii?Q?ZSdzM0oNYblqemyemSQtK2+vkFtA9l04PLKnx8tJgRA0DIJh0gQOhNIT0jcK?=
 =?us-ascii?Q?OndwqCI8P/ctAGwvGLGYpZmhjnZxVq5UtiExOjEts1Xr0o07X2fK8TQv82TZ?=
 =?us-ascii?Q?Cv296W9CL3DtXmDzSRvaKK/Fw0AsQ6X57uQIZSSVp1NBXFt4KMuYTl7+xyv4?=
 =?us-ascii?Q?PrOcEHugM6IqGJFLy2ctJpy0N032uAQd5ryms1cRtEw4EGncNy91pcKhftwY?=
 =?us-ascii?Q?ko33vMEs8QpP2iOz79yelO48NmH9xCGl51F8VmpO8ujNhrMYshLMWJwm+2Vw?=
 =?us-ascii?Q?qxMRQgaMpco1Ap6nNwpwOn5i2VAHyuFfQxRq5XMMHzv5kvaWtCTlnBfxdmWI?=
 =?us-ascii?Q?D9JsIccukHZYL1SgcUhjVzy525r5P1mv/N6lY/qCvCrboDH/AVJ9mOtjxg9K?=
 =?us-ascii?Q?AcZKQXej+RLllwfZPSsR3J5PT8JrPpT9rhCuV3Q5ow=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3ksQiaJmSQcJvH9wIdb83+gjddQyZIvuyzOlXhU8gFsLeYr2835sIpqyqcUr?=
 =?us-ascii?Q?BcuRZRzO1LOB2uQMmDMv3N9+80NTd4PLizjIjcVjwJt89KcPAYPOV42qCXRK?=
 =?us-ascii?Q?QyJ+7IJ7hZ7JHKir7l33mwEtC/e1hFN30Ut3y6hXDmM6SFD9l4FGa0ydTUXG?=
 =?us-ascii?Q?chM0uP+kEiXlzmd2WiQdjNPuNnwDnhkVWwqDg+hAYx7HoLQrShqfmmQkTn3N?=
 =?us-ascii?Q?PPtEbLDPJ70FRvLd4jrBHVQPwJuREPdJfeCdht1/DhmOU1fqhJ7+6/gGMDIA?=
 =?us-ascii?Q?+9YNO4CU5J6q4XLDhYSwdaVBCkwYcKD3YlZLwVEUL7CnjZfudFEkGTiC/4ZM?=
 =?us-ascii?Q?sIYjLvcqv4HF/fDMqK0GFwXuwSMUCOTMC3pFgC7XuI5EiiQps2eNLJgY9820?=
 =?us-ascii?Q?DpO2RcArjO2TZTVF1CZNNaxvDZtsCFdLAkDQtT3uXVHxZFrMoJL30wOJOVCL?=
 =?us-ascii?Q?iUxfCjPXfi49qqr9cwnv3mXjEwrAtnSz3ktNX2AXaoJnsdrA5/2SgATnRL9A?=
 =?us-ascii?Q?PZr0cmVbkq7cR6OpVBdh3BgdH3Sx+j638UWzYz9X2F71r+uwFwbll3k7m59d?=
 =?us-ascii?Q?jGRKfnXP6Zu4gejzIOmweGy9F9DnyddfWNnvVGKuNmrAwa9YS410QYCs7As/?=
 =?us-ascii?Q?3VnN9Ytah0S0aozPsHnk//gsctDSqYBPUKu8xHdsLqKU/sT+OxQTTbjpofA4?=
 =?us-ascii?Q?JY6D/K3a4Fk+/sxkspq5Trw6cAwzeuOKKHSqeDycty+cCpvK5FveZriKfNXL?=
 =?us-ascii?Q?MO5TSbpMl6crawhtAcDxAkR8kFqoFKfEIkcCCDT8KQ+KdOvzHfCHKSYFguKc?=
 =?us-ascii?Q?lapC97uCTaiiZui46Cxy5b2Ry7/oOvXqCtPFiCUIkfn0PXgwUf7crsJ15ZQy?=
 =?us-ascii?Q?sZmpG2RILNKL8D8sZKkdyIzLKDDqDtqwhoJ54E8G5V2EAIoVo1WTJ46Kd8PS?=
 =?us-ascii?Q?5tkRVB9k6Gebgi9UO1v8ryRr2IWIyCkB2mpwT+Txaz4O/hnbWOY/I+yMN/zR?=
 =?us-ascii?Q?zsBQ4s9OmU7ptdsWqqj7MyzfyW2FqkBlc1Yzgsbw6qMMPMUb3KHfGap7726c?=
 =?us-ascii?Q?/lncNQQ42N+CWe3tzxet2TKzUJr+2IMoevBOCmNbmXc9nLz5gwkYlyF0zNqR?=
 =?us-ascii?Q?IkLh1lz+pcfhv5cioT20A355EAOtb3WlncG2syWjbQXX7L2p5zBNMIDv3Tph?=
 =?us-ascii?Q?qqQVLzwJmfBdH1tth02ZMMR7nByG4oF7rlv/QbYEBdaTnOAYPqQBIyIfEFR2?=
 =?us-ascii?Q?AFxt0camZcdClKfFnEdD5B3tnm4k3Lc7lvuiyJupfpYOVVtZl/Ux4mJTMVHK?=
 =?us-ascii?Q?LmQygFoX7mzRFwTqyTAstTunVdiUudC73UDfFWLcLlnZMr6Y7dFx99mVSE0+?=
 =?us-ascii?Q?17psSBSlKXIQyofilNoLBjoqk2a9vOmX/wQmnkEDXzvZsqqIzUnkjTA91f8B?=
 =?us-ascii?Q?PsAsLp5V9bCs6/G9cNNvU4LwdMEjQ8pkOr9Ew5UEgn1Fdp0xc3K5YgvNc5ME?=
 =?us-ascii?Q?UIRQRIHrflM54T3E//TLbDLUH1qsbe4ZnVdDeMwsuSpvLAzbXpLu1L+vwZfO?=
 =?us-ascii?Q?bc7FecLzDpnUIhSsD7+aYV9Xaegy6VPBHNUdFNqodfTBh9JS0DGaEUWue5za?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ON/my+lL0/+lDRC13sawOVh/OdC63L9WQJ5wqzbgUY4qyWgr8eTPWO27xhteJ3CXl9GpL2yfV1qzepNDJrwAuVlfIMw6OZ+l898F2aQus7xqo2Za0pbF/VhUvleKdxzYMRq9R25VnncQ8DpjuI8OZYZoKJ1P7LXi7elC8sJ3T9+d7ADKyLcb2x0uTHlNVAI5EHvsguYgHMoyJDWYaguI+5Gg+F9ukUG+nSspf/KLgqnzuKonTIrAaTP/fhhyN0X5ypFcu5adXkoF5feR61FZgbxBu4xk+y4jnC//lEfci2MN4gY5XiJcd9e486fU8buomz18plyk/JjRPWtTaM7GPTUiExcUgi2eiG0GOMRJ0YfEq7hJiXAsQ32jfJj0Ys0ozs4U5Zh5TLMiSqIgMWqdnY2LIgnJkPblhVl3uVwM18o7Jhz43UvWVxW7iFhzdebUEk4iu9UvSHwYwNSIasFnLFaHEdZ/ItvYz0gMuOTqeJk/wTx1xSixvNt0Uh/g5tMpnGNLhJizjyxDqTi8SqIn64oCrvakicx6BI2T66q8A+GoTzxZfF7jGB9gU7oUP/1cQs9oDydEg7ylUGC5XPaY++bsc/Mnl67pUYRnhtDBdzI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1808efb6-3fe4-4d45-aed1-08dc7b57f950
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 18:41:35.6782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IQRSXO8nNh3JzHVxliI/gThWNaBp1WunQDhbvLS7TwIwHCgSUvJEj8aqIowGuBVPPPunI8kUeBf0uLUXQNSF6FNTF+2zaNLH4CD1Kba5lA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4166
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_11,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405230129
X-Proofpoint-ORIG-GUID: 3P7L0Bxq8mbWdTR8L9HlNlCsB39VhLlw
X-Proofpoint-GUID: 3P7L0Bxq8mbWdTR8L9HlNlCsB39VhLlw

Can you split the move of sdt.h and sdt_internal.h into its own patch
please?  And I guess the pkg-config stuff in a follw-up patch?  Still
need to look into that a bit more because I have reservations.  But
the moving of the header files is definitely something that should be
in its own patch.

Introducing pkg-config as a mechanism that people can use is a separate
thing (and as far as I can see, could use some extra work anyway because
e.g. runtest.sh still has other absolute paths in it that cause failures
when the DTrace build is configured to install things in non-standard
locations).

On Thu, May 23, 2024 at 06:56:54PM +0100, Nick Alcock wrote:
> This moves it out of the way of SystemTap's rather different sdt.h,
> and lets us remove the barely-working kludgery in the specfile
> to work around it.  We point at the new location with a pkg-config
> file, and can immediately use it in make check in the installed
> testsuite, compensating for any install-time changes in the
> location of the dtrace libdir.
> 
> With this change, we no longer confict with any systemtap packages!
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  GNUmakefile          |  4 ++++
>  configure            |  2 ++
>  dtrace.spec          | 19 +------------------
>  runtest.sh           |  2 +-
>  uts/Build            | 26 +++++++++++++++++++++++---
>  uts/dtrace_sdt.pc.in |  6 ++++++
>  6 files changed, 37 insertions(+), 22 deletions(-)
>  create mode 100644 uts/dtrace_sdt.pc.in
> 
> This is a provisional patch so people can see what I'm up to --
> tests are still running.  Don't commit yet.
> 
> diff --git a/GNUmakefile b/GNUmakefile
> index 7d1af5641f54a..0390db77b4780 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -86,6 +86,8 @@ BINDIR = $(prefix)/bin
>  INSTBINDIR = $(DESTDIR)$(BINDIR)
>  INCLUDEDIR = $(prefix)/include
>  INSTINCLUDEDIR = $(DESTDIR)$(INCLUDEDIR)
> +SDTINCLUDEDIR = $(LIBDIR)/dtrace/include
> +INSTSDTINCLUDEDIR = $(DESTDIR)$(SDTINCLUDEDIR)
>  SBINDIR = $(prefix)/sbin
>  INSTSBINDIR = $(DESTDIR)$(SBINDIR)
>  UDEVDIR = $(prefix)/lib/udev/rules.d
> @@ -98,6 +100,8 @@ DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
>  INSTDOCDIR = $(DESTDIR)$(DOCDIR)
>  MANDIR = $(prefix)/share/man/man8
>  INSTMANDIR = $(DESTDIR)$(MANDIR)
> +PKGCONFIGDIR = $(prefix)/share/pkgconfig
> +INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
>  TESTDIR = $(prefix)/lib$(BITNESS)/dtrace/testsuite
>  INSTTESTDIR = $(DESTDIR)$(TESTDIR)
>  TARGETS =
> diff --git a/configure b/configure
> index 40b870f81d6ff..bc42c4f49a3fa 100755
> --- a/configure
> +++ b/configure
> @@ -60,6 +60,7 @@ Installation paths:
>  --sbindir=PREFIX/sbin				Alias for --bindir
>  --includedir=PREFIX/include			#include directory
>  --mandir=PREFIX/share/man/man8			Manpage directory
> +--pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
>  --udevdir=PREFIX/lib/udev/rules.d		udev rules directory
>  --systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
>  --docdir=PREFIX/share/doc/dtrace		Documentation directory
> @@ -130,6 +131,7 @@ for option in "$@"; do
>          --systemd-unit-dir=*) write_make_var SYSTEMDUNITDIR "$option";;
>          --docdir=*) write_make_var DOCDIR "$option";;
>          --mandir=*) write_make_var MANDIR "$option";;
> +        --mandir=*) write_make_var PKGCONFIGDIR "$option";;
>          --testdir=*) write_make_var TESTDIR "$option";;
>          CC=*) write_make_var CC "$option";;
>          CPP=*) write_make_var PREPROCESS "$option";;
> diff --git a/dtrace.spec b/dtrace.spec
> index 42ea9bc339586..7823b13d981cf 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -86,8 +86,6 @@ BuildRequires: binutils-devel >= 2.30-58.0.8
>  Requires:     libdtrace-ctf >= 1.1.0
>  BuildRequires: libdtrace-ctf-devel >= 1.1.0
>  %endif
> -Conflicts:    systemtap-sdt-devel
> -Provides:     systemtap-sdt-devel
>  Summary:      DTrace user interface.
>  Version:      2.0.1
>  Release:      0%{?dist}
> @@ -194,11 +192,6 @@ make DESTDIR=$RPM_BUILD_ROOT VERSION=%{version} \
>  sed -i '/^ProtectSystem=/d; /^ProtectControlGroups=/d; /^RuntimeDirectory/d;' $RPM_BUILD_ROOT/usr/lib/systemd/system/dtprobed.service
>  %endif
>  
> -# Because systemtap creates a sdt.h header file we have to rename
> -# ours and then shift theirs out of the way.
> -mv $RPM_BUILD_ROOT/usr/include/sys/sdt.h \
> -   $RPM_BUILD_ROOT/usr/include/sys/sdt-dtrace.h
> -
>  %clean
>  [ "$RPM_BUILD_ROOT" != "/" ] && rm -rf "$RPM_BUILD_ROOT"
>  rm -rf $RPM_BUILD_DIR/%{name}-%{version}
> @@ -222,15 +215,6 @@ if [ $1 -ge 2 ] ; then
>      %systemd_postun_with_restart dtprobed.service
>  fi
>  
> -# if sdt-systemtap.h doesn't exist then we can move the existing dtrace sdt.h
> -SYSINCDIR=/usr/include/sys
> -if [ -e $SYSINCDIR/sdt.h -a ! -e $SYSINCDIR/sdt-systemtap.h ]; then
> -    mv $SYSINCDIR/sdt.h $SYSINCDIR/sdt-systemtap.h
> -    ln -s $SYSINCDIR/sdt-dtrace.h $SYSINCDIR/sdt.h
> -elif [ ! -e $SYSINCDIR/sdt.h ]; then
> -    ln -s $SYSINCDIR/sdt-dtrace.h $SYSINCDIR/sdt.h
> -fi
> -
>  %preun
>  %systemd_preun dtprobed.service
>  
> @@ -252,9 +236,8 @@ systemctl start dtprobed || :
>  %{_libdir}/libdtrace.so.*
>  %{_sbindir}/dtrace
>  %{_sbindir}/dtprobed
> +%{_datadir}/pkgconfig/dtrace_sdt.pc
>  %{_mandir}/man8/dtrace.8.gz
> -%{_includedir}/sys/sdt-dtrace.h
> -%{_includedir}/sys/sdt_internal.h
>  %doc %{_docdir}/dtrace-%{version}/*
>  %{_unitdir}/dtprobed.service
>  %{_unitdir}/dtrace-usdt.target
> diff --git a/runtest.sh b/runtest.sh
> index 35d5006978469..78f47c23897c8 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -579,7 +579,7 @@ else
>      dtrace="/usr/sbin/dtrace"
>      test_libdir="installed"
>      test_ldflags=""
> -    test_incflags="-DARCH_$arch"
> +    test_incflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt)"
>  
>      if [[ ! -x $dtrace ]]; then
>          echo "$dtrace not available." >&2
> diff --git a/uts/Build b/uts/Build
> index f445115d683db..99bdf19638a50 100644
> --- a/uts/Build
> +++ b/uts/Build
> @@ -10,11 +10,31 @@ uts_DIR := $(current-dir)
>  # provide the userspace versions of types defined distincty by the kernel.
>  
>  SYS_HEADERS_INSTALL := common/sys/dtrace.h \
> -                       common/sys/dtrace_types.h \
> -                       common/sys/sdt.h \
> -                       common/sys/sdt_internal.h
> +                       common/sys/dtrace_types.h
> +
> +# sdt*.h are used by programs that contain USDT probes that want to define
> +# probes by hand rather than using dtrace -h.  SystemTap has another header
> +# with the same name, so we install these out of the way and provide a
> +# pkg-config file to pull them in.
> +
> +PROBE_HEADERS_INSTALL := common/sys/sdt.h \
> +                         common/sys/sdt_internal.h
> +
> +# The pkg-config files undergo a few translations with sed before installation.
> +
> +SHARE_PKG_CONFIG_INSTALL := dtrace_sdt.pc
>  
>  install::
>  	mkdir -p $(INSTINCLUDEDIR)/sys
>  	$(call describe-install-target,$(INSTINCLUDEDIR)/sys,$(notdir $(SYS_HEADERS_INSTALL)))
>  	cd $(uts_DIR) && install -m 644 $(SYS_HEADERS_INSTALL) $(INSTINCLUDEDIR)/sys
> +	mkdir -p $(INSTSDTINCLUDEDIR)/sys
> +	$(call describe-install-target,$(INSTSDTINCLUDEDIR)/sys,$(notdir $(PROBE_HEADERS_INSTALL)))
> +	cd $(uts_DIR) && install -m 644 $(PROBE_HEADERS_INSTALL) $(INSTSDTINCLUDEDIR)/sys
> +	mkdir -p $(INSTPKGCONFIGDIR)
> +	$(call describe-install-target,$(INSTPKGCONFIGDIR),$(SHARE_PKG_CONFIG_INSTALL))
> +	for name in $(SHARE_PKG_CONFIG_INSTALL); do \
> +		cd $(uts_DIR) && \
> +		    sed 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g; s,@VERSION@,$(VERSION),g' < \
> +			$${name}.in > $(INSTPKGCONFIGDIR)/$$name; \
> +	done
> diff --git a/uts/dtrace_sdt.pc.in b/uts/dtrace_sdt.pc.in
> new file mode 100644
> index 0000000000000..c5506f9355d92
> --- /dev/null
> +++ b/uts/dtrace_sdt.pc.in
> @@ -0,0 +1,6 @@
> +sdtincludedir = @SDTINCLUDEDIR@
> +
> +Name: DTrace SDT
> +Description: DTrace raw SDT headers
> +Version: @VERSION@
> +Cflags: -I${sdtincludedir}
> 
> base-commit: 0f499300c150a3a8878361e31f3ba167f7d5b851
> -- 
> 2.45.1.275.g567cb0950c
> 
