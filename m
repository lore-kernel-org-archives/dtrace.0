Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92A21E500C
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760066474; cv=fail; b=Zf0AEAwYekV1qkBJAVIVRvyu4x8TE5AUOfAyqaYBVNxvIwIR+6TQCvgJSIcCyMyoTdGh+VQb/w+f5C89iLS0GaPls1MhKk0ZZbD3j7lBwKuMGaLqCOhvLHmZ2+AXv9tD32y4W59BaXMS543tsyR3ALuXshzgCLCvVC6UHTV/ltg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760066474; c=relaxed/simple;
	bh=L9LrZNzSLT5hGzTKtQRxDQ8fUHpYHh95+Ec8aoIAod4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c8D2z6abbdDikSkoXs4xSbUdoIZ9ia4qUUzRLxtJPXRIRa+PEIrFTk+D5CTlcrhPE0RtJS9mzXTWhwBdZDTSjmCxIJA8Dokx27ehfTMllNLVfkkrzDrPkDuXscAqfrwTz5ucOqxso5h7qzPcdEYP49R2uGAjKJ9JIh2ZCY85YlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZfoFineQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eZj9U5HI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZfoFineQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eZj9U5HI"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A1OuWm026243
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=olZ2D2AoZmWzQBfIgd
	Zu2ugNoz1/cMUSmHdomzHX2Xs=; b=ZfoFineQJfRxTJlki37uHVF4SKxfpUpAB4
	dnfRXrfl1jkGiovzH4IZw3ulv/4JUmyeBbVUD+JP7SsfcsED7k3Xz+MpDK4gqOqs
	aACcs2fC1nyPYeaYU2p3e8nQScBpMbDErUGVNDlxZhNzA3ZnBwwlLKDWbKLjmA5e
	9xrv4z9PE8Qsai0Pvzn/bZkV4CRRv/6jhSWNNG7ixC76wuG7hW2HwgPKdcDaZ/5M
	J+tW/+30aFgl+2nthY2zOOdtAs1WJFHt3NeCx4GvtspQeGygPB0htcmwxaLOp4N0
	lC2URD1+6vDbu+uUB9eyaYCScrCWqCtZjfI/yC+3d6E6FBaNxW9g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv6btu0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:21:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59A2Xv7b036739
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:21:09 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49nv68fdtu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:21:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQmVhawi/mGxvcKo5Td6VOazQaFceCNJZfyfhVR1dAlyV+QArHl38aCrraOxJkMWhMCJ44RxOm41uFGHQg4FfAGBaWxDvMUUuDKhvuONywGV097nYR/0+XgiPxHkfLKslET/oxWHdFMPzHvtV4OcNf5rexxOhyeB7TxFs5AtNE90r+BndkpQQQ6+NTG7mIBmR8SBNG5W+9Ym1LSwqcLnX7WR2NgKmK7wQzVWj87Z1fPGG/6AbOhw0Cf+dsiDCMdbPZ4rYRhbZ2rErC+1g2Ao9EKbZrlDujdylSRmBwx/Dc4smx9SBWUmCCV+zFH69mcSMuOEscFhE5lgwzJ83FhRiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olZ2D2AoZmWzQBfIgdZu2ugNoz1/cMUSmHdomzHX2Xs=;
 b=dKmFRBsJy71ooP+lFra4XyVXaXfBl83N+Vbg9tXm/qKuNxkJQIJEj3vbmowFgzDlwE73p3G+SYx2vpUQ5qLYzQk9mQCwgQPgZD4wz0NeA2YUDak5M9qJUHfDK/6NZyGcAV08uwlx8brZdAUcOkXAFu84X7Zh+1CXLQFFjn6kgLcC35V1MPcKjveSsL9je7i3oALCl/DVuA60QVk9Tjansx458pG9a0VGjE0ALSMoiLTFvoC//8VRphy9NCkmZRhhQumG8huyV0F2VIYOJzXmMiUGuk80PYp3XQ4rC92mkQ+V7EZOG8S+FFOwEiz/Qv2SC732/uY+BM/A57R7SdNagw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olZ2D2AoZmWzQBfIgdZu2ugNoz1/cMUSmHdomzHX2Xs=;
 b=eZj9U5HIYnK4WnmyoJX3lyt2x8QRlQaPR185JH9vJrpiC0UUk4C/lGLeL55r8DTQieH/oGUGzLejXlUQGXJ0MQphvx9jvpQIbfhjjAJE1XpMPyu68swAtDTdnHpS3asRxryzh5C7JPObu/Nr/xc1Ul8OU+Sgc9G0ceUpdMmQM7M=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BL3PR10MB6066.namprd10.prod.outlook.com (2603:10b6:208:3b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 03:21:06 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 03:21:06 +0000
Date: Thu, 9 Oct 2025 23:21:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Account again for variations in error messages
Message-ID: <aOh7nwOQW+OU1/5A@oracle.com>
References: <20251010031338.4016-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010031338.4016-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BL3PR10MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: a354002c-95ba-4b25-d421-08de07ac0cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sr1QOb8JmXX64InOo55L6SwdmjuuRbz892wgF8BFJBltHPZmhiaWb3S/x6dI?=
 =?us-ascii?Q?ZhzK7N5dn8M17laubqaqYs6be7eYGKpzxs3CaH7pIWp5mvyNfGZvPoOhZpC0?=
 =?us-ascii?Q?o9tOETFmf8nQECKTgeaISToIjG3DpMEZ4nYtuTfpTFW4iVBpm4IUAOquEbHw?=
 =?us-ascii?Q?jpG3U3N5l+KnDikS2uq1VHRtk7dvZ+RmR16r8aX+uOwB3LZq95TPPOkdU//L?=
 =?us-ascii?Q?4tXGedK1YTXqMtlOabx4cpazupqEz1ODzpWqyaNjU/C4LAzIFY2ZZhWAxCij?=
 =?us-ascii?Q?XueNZ8+BvjJUe0m/bgsepYyVQ/UnKoSlrWY2y9QcnqLfDxiBWcIfLIHYpcFD?=
 =?us-ascii?Q?fLhI2vtOnOuR3kJNr5cduSO0h6zHRI2chZvtI4lkCzDk6WC4MXR8k+OKsNiY?=
 =?us-ascii?Q?YsoV7FqznXCgSIj6Jzo6qIS37pCTrraTDzpQnYQXKe3OYmsTSjF8NDwBx0lM?=
 =?us-ascii?Q?bzImtzf+MlPMJdrkxa0fATIP30RlbIViWax3W7hDTDCTIxuKyp5WKLCWDuG+?=
 =?us-ascii?Q?Ttw860X0VWnHqzCG2L+ObSzFW+oiBgDWXT3qUP0EHxO2IIF10iCJ524LgeDT?=
 =?us-ascii?Q?v1SFtPbXwHWVZOc/wQPeKtaDIbLLhHUhPMzOxESst7E9nxZvorZM0e/ynAHL?=
 =?us-ascii?Q?nGYLo2ZUN4wpDp9+bfLxkwbT9OuOcGXPt9JnaxGTCxvYC7xgE5s2FY4nS5lt?=
 =?us-ascii?Q?T5QupVp8ORDAK9E5VZsgop2rSBM9MLaOakRoNPq/FSo1IcFU7GVynu1iODEf?=
 =?us-ascii?Q?LZtpihK/7e/CPvAwrg5IfgoXQjs+hGiwkf0dKdaYVp7ls4b7F4+PlT5clnfo?=
 =?us-ascii?Q?ztkTHAWJ59cnYZUCP05SR9KKzpDnCjgiR20l4R1qbet5+1bJu5LzA3/Zs4xS?=
 =?us-ascii?Q?/u9nEGGf6RQjfJeK36DM90rGqaT4bwk+NUFPOgcWTKoRW4AksnPaRXv2EjhF?=
 =?us-ascii?Q?x+AD1NvEjVio9Y3jMXklXdmCKNtag2ZTQne41GkPggSh2T6JzseVx6nwSqkS?=
 =?us-ascii?Q?wcKXaOf+/8F2TXzJ8ScE6rLcYcKv9Tuwpz1cmmrXz3xNWx8qzFj1/WVLCCiG?=
 =?us-ascii?Q?A0jF2djhWbEek++T0+XbRtBUmtnhLzFHh6JU34pb6cP9H/tPNEnVX8gyhtBJ?=
 =?us-ascii?Q?MkTZ3n4sylT0jZF8I+hr4Xhtv4zBMZA5QQF2rXTyfZHINyYzQ9R2WpmjiJqW?=
 =?us-ascii?Q?dP+iSOauQenwalRMkwUIIzU8Ay4Ykznk+RQp8xb9FOTuHC7znCoyqQpCQZGC?=
 =?us-ascii?Q?zyClX+yN2ZENguawnHDudmp0AjeAptrk+l7nhK8bX1fSjRODKODE6ejNntG2?=
 =?us-ascii?Q?70y1wZX1rlkHQx8frlTgW/L/YjC3kAoAv6ClA6947hTEa8EPtjmUm7V9cCKP?=
 =?us-ascii?Q?r53nJSm8+DlEMFuTldzmPDj0nmbw9IxlK3ToLB7BfYDlE/SA7ysHqBfKuhAG?=
 =?us-ascii?Q?R7TBFkEOgJYFaREl6/8lhVGB711rM0oQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Cc5+pTFJ1YWqfL8lJBmnzYGpqH4Xn5Du7/uhaWeN5YEbAo2S3DZ0hwMBKP7?=
 =?us-ascii?Q?Vrw3DpsoBwLs4iIUhMB/NzOGst14KUsv0BpQ1l8VjuXlLq03205EiRRF92+w?=
 =?us-ascii?Q?fDdZQEuRKb09r0gGJwIacl8+gvgQNpjfdce43SnP/SqxQtv7uZVlekHLvV0a?=
 =?us-ascii?Q?Qxk5i47/rkgtg82YazqrV+NoXdrMclH2d+xGUnDjUdHb5vr4Cd0VlTcDJCku?=
 =?us-ascii?Q?Aaemi9OKlRqDF5yTslhCo8vrksvaz1e3ytiN9n7IHstdPy1wrVomDoCFsQ55?=
 =?us-ascii?Q?2XhNeR9xereKjIjdO8QOSichE1qr0asToTCH/OaraT/us3fGtpZq8V+y4iKU?=
 =?us-ascii?Q?NJaaeffK9VVJ1h84GgD6NLCjjAhckP/GE2Wi1z1lA4Gnko0kXjvjZvODHkJv?=
 =?us-ascii?Q?RXrLSgGSeqzGeVQJ4pmOx8IoiGjX0XT4ijVhjlffY+RefSnMv1CsisjukaK+?=
 =?us-ascii?Q?iy5stUEihPO1qMtDz+s4ObPp4BPdcRmZF4EMIoxGoTadyRYPyMW0nqR9Pak/?=
 =?us-ascii?Q?HM3atWjGQ2ex8ueTQ/x1UBQUSe61W1+QA8bJlL6OczlQvQzIObB1wUELCv3x?=
 =?us-ascii?Q?GBiLzl9AKlF1PKytzsMTn4nOgEs0LQU1ftYtw+mTSG1Z4WOlddugN+eYCnFE?=
 =?us-ascii?Q?vazSbI7TSRf8yGHpYsklxk6UYV6WXcnKGRmhdLPcsAQ8pJpTjqTI2U4p3JMN?=
 =?us-ascii?Q?xHI3hq0c2X7J4uhUXj46IM1drNnWsnZKT/cMcI2aiyDiO4nIuk1TAnVXm1HE?=
 =?us-ascii?Q?rTKWzGcdKm7uoNXEKHq34hxwfDH/P9KpA+xpXKq0ulunDo6RkkGo7NVyRsmH?=
 =?us-ascii?Q?R4bVK0ej8KpFKUzAz4CkCLjUagQpoipYLWpwf9qVpgbmYcxcDtZf/FDrsk9b?=
 =?us-ascii?Q?03A5HHjy+Nrc5/ZWil+cl6Z6w1sH15SfiV5Auxy5/Yx3jkbPAg7SgdT+eXnI?=
 =?us-ascii?Q?1jIV2bXH5q8wQek21pFxh7urxvP6TfLo+MNaz9oP/1UW2plohoC7s20q1j3m?=
 =?us-ascii?Q?vLcA+mhMkFIMKwbvCf2LfnpdrMBUg12TubATOpcBkfAfGgAqh+0CYEJkjp/Y?=
 =?us-ascii?Q?tVARaiA/mQkeOqycy+rkSF/DmBfrvh7m5cBjuxo/aW2k7ZSPbdDSMtgbve4Z?=
 =?us-ascii?Q?20rcC7Sa9c5NrXRZ2TUejEOvreRfcTiZmzvIGJbH9WflUkCRhrAAMCbA95Ri?=
 =?us-ascii?Q?EQKaWbqOHph/Bpi/FIcikLsvTBK0yl1qCp1qtjb2JnDG7lgp65gNjVNiNgV8?=
 =?us-ascii?Q?G0ExGjFA2+vVYibhwWF+2MgaTvimXG0+Ly0UciRNibYSKHVy1IsuD3eLB4oN?=
 =?us-ascii?Q?Dpn3PeENrbgyb/kn5T4rbx41o1ntIQt2odkflwORrbnPPdqH4I1I6su3dFlj?=
 =?us-ascii?Q?+8xnNNtPmrOuzHgr6ztk8J+3Q6i1xqmTdB8amqcmzlPWQVgLDTdQ+VsuFDvt?=
 =?us-ascii?Q?wwiG2Q1rsHYDV80hZ5gfSkRzDz0LZB39hN/Gj0rmB2twmTfcxiajiaVfkXEK?=
 =?us-ascii?Q?+DZW3npuS9/nZ4LSn0ggdteHktu5/YhV9IoWnWcwtoFE+EB5GBjLOXXlum0X?=
 =?us-ascii?Q?GNNtTmOukad1QpLKxFzTJrcX78B1b4dDkRHTG5YXLFiCn2kY06CEawPfcnAJ?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZL4SpYpfLzvl5HzJ4V4BaY8mRS2vdZSKXxhWXk7FbvGof6imk/2ntFNDZSTahIp4jyYn86hX0omkLNIdP1lv7/gTzXThMuBjMnoSAYutNW1YDtgvc8Pv3zhH1+wZ51ISJHk/p2BosNs6zXt4XL6LGGykcB1le/8L+N9Bte6dRub2u+7rE8DjLfFEtHVQkZdNG+av8kWhjU3rxWiNRub6LEsL29zmD23igqCfBzkEzJ4By4N0fqmVwHbhbLGZCfB5CVOniZnRTn9qrbJhowPgSRfT/Dt3ZEX9JQMJWlyqzOaP5ha8sfYaaRjvOg+Uuo7CjFQtOPobbgE7z/2F6hnMIlsR4CUevZERCDIcrsHSVEbs4oGQ01cuIHEAfnB5vAsDMj+qL7e+9U2WuX5Q8S0MS4D7SNG4QCO2V2detIriFobo+nwJrJPfGtfZXv1NgLonOTuA32bC9/PMfoO0v9rphlpnFiWxMK5H+XuZV7yh8pYIYhimZw25wgYd0tYmuPfAkaQNQ6udeudSZTVwZWDN2yIka5OWkZXj75NE3Mf3C8BvGe9RCL5Uv3kmd+lGlSaEcO3lfsBC1NJ2A0L3CzPIYzShJfS+JLOtiIsOYU22l3E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a354002c-95ba-4b25-d421-08de07ac0cbf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 03:21:06.4735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiOpN8f0cbh7wCMB0TVDs+KPt0DMIRiB3eUkKq1LZCFKvGvS9JXyB1I1aenFPN/S5wztsW00MYtk356mPnFWLWeWJEcX1Dmzxd8RQ0qCDxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6066
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510100018
X-Authority-Analysis: v=2.4 cv=BLO+bVQG c=1 sm=1 tr=0 ts=68e87ba5 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=sWKEhP36mHoA:10 a=yPCof4ZbAAAA:8
 a=NaB-FlaEX9bnB6FGqR8A:9 a=CjuIK1q_8ugA:10 cc=ntf
X-Proofpoint-ORIG-GUID: Pz0eipbzTvXWyanekJ4HT53Yf707NzKX
X-Proofpoint-GUID: Pz0eipbzTvXWyanekJ4HT53Yf707NzKX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX+4qamgM/gPeh
 8MXJYRBRRML0dF5BBXpa7hiFEko/8/h7CZD7FMjzIheAgQvffUloLB/ywRQpG50VK1cH4RPKz3i
 IwqaRO7u0OPYnrjcR1WjEJQFOxJj4t/ZfmQhVIPMxMsD8pyzSbSdVR2YFHJQ73TpWIfFSSIBsF6
 KVg+9dnf1JLBi+UXoP+zmkTuWQ6YoVoomFU34BWsWM++lGMtJdoH+QqhWnfl74F7l+r9X27oeOL
 j97yNKq1Bd+ekvYeFIkSO+t0Qb04yRlAwj4tVFt3cbPkZeZO2XDh9rR745NunxYBJTZnZomwyZV
 zmQAOYdMxDa21ZYkzfu+BUqYBMIINSjZKthv7Y0bZ3j+NknLb3eNf2jeBhi0rpoeHllgUkkVLA9
 Nn1JN/X2IKRxm8yQE0GAAHC6OzSLfeshnvUpNqBl7FMrAM8xk+0=

On Thu, Oct 09, 2025 at 11:13:38PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit 944dac095 ("test: Account for variations in error messages"),
> an attempt was made to account for variations in error messages.
> 
> However, it was applied to the branch after commit 49e646183
> ("test: dupstruct: fix extra duplicate identifier case"), and conflict
> resolution was not consistent.  The earlier patch "standardized"
> messages by applying an optional "enumerator" where that label was
> missing;  the subsequent patch did the opposite.  Subsequently, some
> logic got messed up.
> 
> Fix up the logic.  In particular, standardize on the shorter error
> message (without the "enumerator" label) and adjust one .r file
> accordingly.

My bad in merging, I think.

Anyway, I think we should standardize on what the most recent (and hopefully)
final form of the error message is rather than the shortest.  I.e. make the
current libctf error message the default, and adjust the older version to be
like the current one.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/types/err.D_UNKNOWN.dupstruct.r | 2 +-
>  test/utils/libctf.r.p                         | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/test/unittest/types/err.D_UNKNOWN.dupstruct.r b/test/unittest/types/err.D_UNKNOWN.dupstruct.r
> index 762b24f4c..7afa74aa7 100644
> --- a/test/unittest/types/err.D_UNKNOWN.dupstruct.r
> +++ b/test/unittest/types/err.D_UNKNOWN.dupstruct.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: failed to compile script test/unittest/types/err.D_UNKNOWN.dupstruct.d: [D_UNKNOWN] line 17: failed to define member 'x': Duplicate member, enumerator, or variable name
> +dtrace: failed to compile script test/unittest/types/err.D_UNKNOWN.dupstruct.d: [D_UNKNOWN] line 17: failed to define member 'x': Duplicate member or variable name
> diff --git a/test/utils/libctf.r.p b/test/utils/libctf.r.p
> index 8a6fd8b13..b7c8a5e04 100755
> --- a/test/utils/libctf.r.p
> +++ b/test/utils/libctf.r.p
> @@ -3,10 +3,10 @@
>  # http://oss.oracle.com/licenses/upl.
>  
>  # Possible 'enumerator' label.
> -/Duplicate member or variable name/ { sub(/Duplicate member/, "&, enumerator,"); }
> +/Duplicate member, enumerator, or variable name/ { sub(/ber, enumerator, or var/, "ber or var"); }
>  
>  # Possible trailing '.'.
> -/Duplicate member, enumerator, or variable name\.$/ { sub(/\.$/, ""); }
> +/Duplicate member or variable name\.$/ { sub(/\.$/, ""); }
>  /Member name not found\.$/ { sub(/\.$/, ""); }
>  
>  # Could be union or struct.
> -- 
> 2.47.3
> 
