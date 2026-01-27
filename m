Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D360D21CC7B
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769531911; cv=fail; b=of3NgoU1XqnmZ2WvuzjKDmp6lfTq++JWfah7/ezqr1WTAOUoTafk40NbAt+BB/mC3wEmCk2kUqsHlWGZLYQRqzil/n9zGLH4VHNsVLsjzTSb1hsTfH1pEpZ6gva1Pe0FxwPn9BeqQ9jewybVvJQyMIVM/QRMzuo8QsrBEyPHhrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769531911; c=relaxed/simple;
	bh=HDxEG9mlYE2bhomHVqh9QwkWcAWvP9VQvQDsO9VfAYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K/sKk6oiwrAO463bNHxidF0m9y4WuZQTDS6urDl+Tha7HxJ4+17weKJhZeAxJwbpDNQeIdwVZ46d2HA7LPNCd2chPwugxIRQeT0BYsufW7AQMaPoqy+kSp9G46JpIEQ5Z7C1uk75PgDPlbctjbYYZCIRDFipjWFKUH8aDp3WH6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A9eoHXSF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H2My+zJU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A9eoHXSF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H2My+zJU"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBEGx13713679
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=TKY+036Rych9aFx7ia
	yIM4SHV5fm5iuEz4dGYkHanu0=; b=A9eoHXSFRNGfv6/wk6+n2U/LR5WGiWxvQa
	6/yH27FrOuJVaBGhUbGJklyv2e2pmIN9Z8xmBoNyYZ2LvRCpBuqNV6JVpBM0JVz/
	UBUNKkauma53VUruFrDbGSrqain3UOhDz6xqy2uVpe7rUEUVc8LwBv9gnEqwTIj2
	ZoktTnezUNuO00Sw707/o4nDpb2c36tfooed0UvInGFPvVyeKv46zNU4dU2RZImA
	MFXOKjkyDmqwlnRJtjpg5FIZt+6ALX81DVakOSzT7djLsLYOJekWxBicIu9iO4p6
	FLNLUnDcBI7cyzbsUb1ylcSbqz2SBtUI+9KWuR4noSO6NyX9v42w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvny6vayc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:38:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60RFiCPa010548
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:38:28 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011050.outbound.protection.outlook.com [40.93.194.50])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh9p8wn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:38:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfcOv+AQa5oz6S7uvuhLmDxbMrztA0FwHFEwgupUvdwHSohqPHRmGpOC0s5z15ZTzHfNdO20RumTKsAOPCu5vRBjJfTAB3BsXyPcH/EeC9+dgakzH49Hl8fefmVA2+7DG5tJgx3/gmSfyqelzF5KFDD6P8O4JqzOy6lU65U7vvH4hF/O6ZPbAf+4+R0kTDLKNsGfDZLfp0yDuLfYeA67SLv6x2zQ6WkXl6Ewl2rdnpMIk+kcvE5BVO1pU6tAmDwCXUxMiHdMm+i06ggAJKle4oBVcQ1dWWUu8Yx/Kfjo8KjOthLkvOoeIiOVQOpBRstPDuPcbxeHPq07pr1aLptYqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKY+036Rych9aFx7iayIM4SHV5fm5iuEz4dGYkHanu0=;
 b=UcxmJrea140AqUvGd2VU6mtwSMIkqb/rhj5owcr6I/P2mC6kyS02vYLg6yHzN2D/Js9F+gNeR6xOMjbwIWmufr0hd5LUodDKJHNsbWnPBEDE07XuA7HetLgjYnO/7RVa6lcMwVlXCl5O/BAAJXNFbRYWQgSe9QVPJlKe6SGPwXJVZTraKmtMxQiz4JAMRB9WJs+UXbLu/UYgIRLUxngE7FgSvInjnrEmt+JQZw6iOXgqcq7fP5nFkDpoAhFJfGW4WhMNyfp7UfeCiQ61QTfs6xB0MFVxyfTDwH+7/46EDSfqByv+LDBbYxm5YTjsLL5H5TcMsxraJjnWyvkEFuvong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKY+036Rych9aFx7iayIM4SHV5fm5iuEz4dGYkHanu0=;
 b=H2My+zJUPGFfqmW6Gq829nVE827JaezrA5VT01a5NasPuCxzcbPxLGtF4sswZnDS413ZSgvVXehmJ4nG81svZNlYsMyNOdMezFMwRh9PKnGppcLHNHuZjyrq6o7Z5wsj/vaPeaMxKJT+V46Mxx+jbCNghZBw+stzwiHOJBzD7yc=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CY8PR10MB6753.namprd10.prod.outlook.com (2603:10b6:930:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 16:38:18 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 16:38:18 +0000
Date: Tue, 27 Jan 2026 11:38:16 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] Support deeper version numbers (e.g. 2.0.4.x)
Message-ID: <aXjp+EV+Cb8ELhuY@oracle.com>
References: <20260126234150.20939-1-eugene.loh@oracle.com>
 <aXgScYsIu94O/Me3@oracle.com>
 <aXjo7yTmrpxJzvJk@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXjo7yTmrpxJzvJk@oracle.com>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CY8PR10MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 082c3c23-fa0a-467d-382f-08de5dc279eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VpSQUGrMlVgS/PRbk9wjCcu39fWSarAZuFLShSPXgCLTlVoRIYRCN3dBRpFG?=
 =?us-ascii?Q?VhWN/XxiYmPpeDNlI6B4tirMJzzfNQf2NCPlvqmKpbWNi7uTerSrAyOhUEuY?=
 =?us-ascii?Q?qw/HEJ6aslyldgETC9+ZRX9lBIq00Rp3Qibw/5xQkB/fzl25gSLtgF5SSbLI?=
 =?us-ascii?Q?DamA5lwS6h2XA/B0f2Y6dYnNiSJpPR6/W9MdMtaiZfIh2FKpy6icIBdc8mqg?=
 =?us-ascii?Q?oXBHEQnIfNu+6EWRvtrYNh+KQOv+x0pWUVvnV6rfgB8BTZnmuh2gjMqQ2dMy?=
 =?us-ascii?Q?44DO8Mv4FXRSNYwlhxQF+PM4adWfMziVW4riBwM3W3l8LlwhsWSQ68gaOn+8?=
 =?us-ascii?Q?XSWmMhzbr1b4PcseXeTk39x+dbSyyxM/R5x/nkC/f/aB4+4hQQ5c3cKAT0Ws?=
 =?us-ascii?Q?1tpUCvhL+uaxMAN2OUvYPzp+TOvu2dFDjcbPwM8txpziwJIGWz11cQAaUkLm?=
 =?us-ascii?Q?+WVJ4NXsvrWXkHYybyuxgrQ/Ri7yqB5kK+2XEi6ePFdSKRVh8z9/HhSwBdkV?=
 =?us-ascii?Q?z3r+AFY7TamOBMz4rjSmNi/sPib0yIm0e/FbyHaamB5EyRvhPRBi3VPETh10?=
 =?us-ascii?Q?UyNgd5lHzFAVLhCfY4ASFPycPXnlPG9d/mMjKUzasQpXLOWtc27VGt52BFZC?=
 =?us-ascii?Q?Ci3cr/qPql/R7RregNSEkRDUWVuu/6Q9dd2HalAPktS2gNWB/i7BKhmcbOyN?=
 =?us-ascii?Q?ZYTN8Tp72umV7zbJSS7CVLcHXeZ6YqzhlZ7I2hNLpC5MEwb4KhT//lwnAHGs?=
 =?us-ascii?Q?WKWLX+o11UII/lp/RBCYXY+hV/ojDDAT53WDhPtkTbPsKXQ2O9t2nJHXsLY3?=
 =?us-ascii?Q?h/TBGaxatLlM7hJBwBTQxdUDqOVAgXflFQuqtDj/0u5MNkqcPtiAAC0VZHGV?=
 =?us-ascii?Q?veu5Al8Hp0SA4esqMWHAM8r3cd6O39PHCAsZaCo8XRwpxLyiRYT01Fj4Dqd/?=
 =?us-ascii?Q?hCOb1I4ullkmxL6s7CAss1qvZnnZsxXP2LJIEnGR98BjfDrjcsnuPbkXfiz+?=
 =?us-ascii?Q?fQZ847G/gbKiQU8zBPkAcmGkbhM6Lxfp75mbdYPTFT3AIwi3CDfYLo33+gmb?=
 =?us-ascii?Q?TJUKjtYoJwwcdG8N4BIDU/nTriYp62a/Of6DlkzmcEE06Chq1HKnPu3Yc2sx?=
 =?us-ascii?Q?VfIqDQLG1IWVXiEDS14y3GN7FhAQ85ANL1v2iT0+BosP9PD6r7osmk9jBeAW?=
 =?us-ascii?Q?aT+zzglMOkg2A2v+ur3+t3S4sADT1I4B4Sm3Zk3P0zgW2bL+OGLDlIPhXnTg?=
 =?us-ascii?Q?9fhFFsm0HeZ/G6QYsSrv3nCj+ZxblyIlz2vn0crbKy2JoT9C1o1clEPn7Ln8?=
 =?us-ascii?Q?Q1sX9N7YPcdsXR/l6YCHTsUPVbJOcJN0tlKLGs1yuzDcWdZCW59mve4rg/c5?=
 =?us-ascii?Q?dwQOA6iGB0l9mpTqXzdtOvGZ3LOPfjTInaONrT5LQTG5ACiW7llWTZEVeN+U?=
 =?us-ascii?Q?AgWNRo3w4jq0VEbnjTxJV7zCIKpv48+rUcj67xypukiMiWsMBB5WYBGd+0jf?=
 =?us-ascii?Q?rpsFs5UgjRgUC7+O+1aBgkskH0qyzmlsaHASfiu1uXkF/z6v81vH4Wx5IMkC?=
 =?us-ascii?Q?bKvJxew7GVqiuw0tuF0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MYdve89sjEJseY92Euf6TuE7qY6IrHjCnLZiIXg/g4HyBfi4lsXaTIlA/3cs?=
 =?us-ascii?Q?9tc00ozNOq7M6xpMIlFYs78Edumd+wT/bEo6q3PBhjiv8u5XJy2uVcdF0nKZ?=
 =?us-ascii?Q?dDyHqARsRymBX4lpLW33C2BOeJVn5nfs/6qiH4hOUdQxgwocOyeM8+IHdj00?=
 =?us-ascii?Q?ephKA24IapXU2pSxYAj1SOT59RztA/7WJVBSlOY2YazGgpl0ZlhYIcpVcaDK?=
 =?us-ascii?Q?+jLnPj+FAu1JOWiOW/sg3kf0T5wiLZYAATLyGt2A4G4oVTZYOdC0ol8iEO8M?=
 =?us-ascii?Q?BPRThN2MA7mU3x8APRkXjFcAOayB6/RpVxl73Yt5g6bMi9BZxpSfkIDgzfWv?=
 =?us-ascii?Q?1xqVjXbhwXp9zC2fqi87ultE3pXbbr772L5dtfZDdeeDFSVO5M2PWhUM3igh?=
 =?us-ascii?Q?LSspCps7kx8lR6E33+emB2NuxrAKmzxD1ADSzW4/v3TRMkuzi86H9H/hkuYC?=
 =?us-ascii?Q?2LZLGXExfORUgQlNOnsizAZmUZNP5dEtLz2rUgdfBqMHQjQO4Qq+3SBfg5ky?=
 =?us-ascii?Q?7IoTxIkDHQImECg5nFZcFrvh56QJ7ToKTZOt37R+XDqpTTRVQkE20pih7TIU?=
 =?us-ascii?Q?hGh4iC9ps5yhHzyV8KQAzzcF/KnToTnWv/k4Ib6DMzlYINXw+79uoOCamSjf?=
 =?us-ascii?Q?IUGPRkC8CURvOq2rhdJxTu0cZWYF5jObo+30nY8T5I2WxYs88nBmgC5uASx8?=
 =?us-ascii?Q?nP1Rxrf9bJ0SFXWxt1Icq5ll/2D+Ombf8E08JoALXZf8WnOVZ9l3gtsWt/3r?=
 =?us-ascii?Q?RejCs2G7aG1VYFM3LM0wxJLhF126P+LbnClQJ2lkjHa9tgIr+fXvHCi6nlTm?=
 =?us-ascii?Q?Eq1D/eymDp6LPIze9cyg+BDMUZmbKxK8RteKoc5hziH4+tbFPELi0aa67VYz?=
 =?us-ascii?Q?IEwfeWrLDSU5xglMnuADq9HFP/H5PRhbu884PTdY3jr7jUSmWO0wG3Z36DNU?=
 =?us-ascii?Q?zjvLFOAU2mT47ed+PlE+utGxtDIycpl+utWPz3K381SR4MBqoBhYV5uMMGKO?=
 =?us-ascii?Q?y1er5ME9CllkYDm0l6MICFF+x/jHy/9RzUYoKeHYKhzT39bmi/0nPRVBXMW9?=
 =?us-ascii?Q?hBw1QFvRPVmkeOrp74BwP4iYOqR35TiitQVzo+1oFW8HtOUKC9dWrOQHzzaj?=
 =?us-ascii?Q?41YCjM6zoOTjiwhVJAHbQ5B4EBnmeRAncZ5zCvVkZxE/b68D9ZvtlXs8GQ+C?=
 =?us-ascii?Q?ByzuR6NMt6niQ+xvrDxU9B1exw+6jMBjMSbh31RjP1W6+DE6vdQ/T4WAKxti?=
 =?us-ascii?Q?SSccuhZHnwElSzCyKhUQyFP3Fm3xwOGIYeEv7LohNNcyj+0qWar/3hA4I7XO?=
 =?us-ascii?Q?XVt34q+784PWxeGwU/zxPFlQf3LbnQVy2SRO2z8XkhCnMnN0z6QdMTXY51mQ?=
 =?us-ascii?Q?BocJW3TrT7SCPswFLNA5Xj7kiRhrVGUtTNYa0esi+u1sgirl64wx68TeEpYY?=
 =?us-ascii?Q?MU272i7mGJYsik/3vsmH49xBzq8QXMCAHRpUWD/W3IfRMj/Qo3AfmMdL01IZ?=
 =?us-ascii?Q?zEo8E72G9gjDA2pxHSbdr9ZrLdcD2ewK0XMBs+mHtwcQeSkBHbWdCpyMAytn?=
 =?us-ascii?Q?IgRSrzhFQGOL/XcMI6vBffTTOWuobteWmNvp16tzlS7h+L7HTgUe3y0RLMdk?=
 =?us-ascii?Q?TM4iAebWcLxPKOC9gd02ZiYIJUBUNiG3R7eoNlp4NiX1q3yS52yU1pkQgIwn?=
 =?us-ascii?Q?aEhKhTdQxH9fluUi0Bm3eXcdAY1Dgk7pwqFxjh6Bphwoh4hbWmCUbatoZ6ne?=
 =?us-ascii?Q?S0lUlKa70N2gCtGiBdgoM03eltz/psM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hsBkSxZqfHNAuqQewTlZQrcJB2KmMA6VGlL12MPBN3bIG9XzgRwwNt6yUopC/PUcSUZhExS0yGs5frV/IFEiLiHthv6LlYOO+VfYgAB0zOhh3q5bTn7W7x1FlM59gdmkFBoRg5erkHuSLiJ9GAKSW+pWl8OEGqx/XIyAHyLNQl6PDOXSr+4qAvTBD1rg5NVA5OGPYPW307POoSgUj4Gk27RuSfwc863kq7UL6oe/vKjjoTEw8o23aE7wJM4fMlKxmhW9vgsFtJ8SMiX/kqLmk2vVEyN+aKTvlnKQoVpRyumBKSHzKOSD5vThE1V8rL9x6H0EDQOpCB0TETfQ4a5LfSAV2EgeKyaDD5SyaqoklyREB5ugfJIeD7MFAIp1F1p219XZqCCRm4JIe+xd1mfKp+0Xpoi7fRxifqCZc4t+naQXjNqTazy7OpkjrbOz/6fP+aGM41Iu1RNtDBzM8mHJ77IGJYGI3nnTV3AQXfAYPisFQwWr8a6MIeYy1/SuUvWx0yKShteGjsW2SkuR6Lf5qlhjSFTRIFUmyiS/CpR2pYhr/UG2Q1I/YpZMAGgAWR5xpPxV+0hSpYtjfW4KNbNJFfFGLBDLWo8L0VpENdOe7Rw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 082c3c23-fa0a-467d-382f-08de5dc279eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 16:38:18.5490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8w+oWk+EGZBjP3jpb2TRsFxaQYgcmRuL5D1mr6ghvlrwW4O+vTtmNKch3htf/uunjqaDRvOGJt9nP+vQ66dwTgyuKn5bVQnRR77izT+OCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6753
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601270136
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzNSBTYWx0ZWRfX36SwEZuv37i8
 1XVAZkhBZe83HazbiuO8kOUDW4uGXTqUHQojNGktNpFjle3M8oQ23BDjG+PpD3SCGxojm41GPVQ
 gqQZmKeiryYJtP6EMtd7Qv9rzLNnswKAtEWYpZdvWkJa8Xdk1mkQ1Bsop9s+ZLcYW3TJSDxCe2l
 ysk52aKuDomKPt/ScNctvXd6N8MV3/3nXmg02yAY2+XhQ51QaeMxJ4/1XuYDP+a5UlX0f3hqeRp
 imFspuer1vAFAovjt9lhwELtgkJ0bD3oO1NkEd2NpgHBFlIYYJ9aHxC4bV83wWLP78uHMLSxvrs
 yRH3NdxXxysPrWIB2gM6QIU8su3U37GIce3SgCMYIrE0Pdk8uAQzyM0JJq9N4D5psZrEyVWEGCw
 Al9ZlFTVUi/fsFgsJoYPkdC2FTLcIUJW7ytPCPycNItKHE1OcNq1yFLT+OVQu7ZKcoutASMO1Zw
 LlOKerLHqo8F7V/TZuw==
X-Authority-Analysis: v=2.4 cv=C+XkCAP+ c=1 sm=1 tr=0 ts=6978ea04 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=7KQ_v7G-jyJe1LC07pIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: XRmyNtsnLWbuRrQ1c9LxeaBwEYqVkW--
X-Proofpoint-ORIG-GUID: XRmyNtsnLWbuRrQ1c9LxeaBwEYqVkW--

Actually, please ignore me :)  I totally overlooked that DTrace only supports
up to 3 digits for version numbers.  Changing that would be a much larger
change, and not necessarily worth doing.

I'd say we revert this patch as being incorrect in view of the established
versioning scheme, and number the release currently being prepared as being
2.0.5.

On Tue, Jan 27, 2026 at 11:33:51AM -0500, Kris Van Hees wrote:
> On Mon, Jan 26, 2026 at 08:18:41PM -0500, Kris Van Hees wrote:
> > On Mon, Jan 26, 2026 at 06:41:49PM -0500, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > 
> > Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> Woops, I was too hasty on this.  More changes are needed...  See the following:
> 
>         if (current) {
>                 $0 = versions[idx[n]];
>                 if ($3 == 0)
>                         printf "%s.%s", $1, $2;
>                 else
>                         printf "%s.%s.%s", $1, $2, $3;
> 
>                 exit(0);
>         }
> 
> Obviously, we need to account here also for the possibility of 4 digits, and
> then again in all the other places where we output version numbers.
> 
> > > ---
> > >  libdtrace/mkvers | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/libdtrace/mkvers b/libdtrace/mkvers
> > > index 6f9240320..087c09169 100755
> > > --- a/libdtrace/mkvers
> > > +++ b/libdtrace/mkvers
> > > @@ -10,7 +10,7 @@
> > >  NF == 0 { next; }
> > >  
> > >  {
> > > -	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,2}$/) == 0) {
> > > +	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,3}$/) == 0) {
> > >  		print "E: Invalid version string: " $1 >"/dev/stderr";
> > >  		exit 1
> > >  	}
> > > -- 
> > > 2.47.3
> > > 
