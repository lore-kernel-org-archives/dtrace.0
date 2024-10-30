Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9C4214415
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730306190; cv=fail; b=JVNBkrL0il47ywv1w7iwKt/mWVZL5p4DSoa0BpeujPUtgbVuyngFVIhk4aXFyvmUia2kiksY9Bl2rczVR9s6TwkZxI5NkuHdNn362yzi+/EYV/NqPrikgAIjwk3F6Z5lbpUt3SFzKTYKkWPsg2bdduJ1mE8c6hZBMyIzx6+Wwd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730306190; c=relaxed/simple;
	bh=uOw417bxIsG5xrcGC6mhGgjuXfnAstYwTtHkdt7NKVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ApUJE9Kd35wbVrobu/5Op3jih+M35636LLEiweeGqZSNtvrlgsmnx6/jKJSc1LfxHccBUBhbY4x95yRRaThJEw7xMbWFMJFByYwVJfXg+SToyMlqi0amzCMZ+/JqZhZswT+zn35NYSiv7HD/rUKw6Cz5xvF7QjfLvIQejtUGvtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YRi6KDIL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xULfxJza; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YRi6KDIL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xULfxJza"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UGXWJc008153
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=UAuL8yudqUPPhgT5Wn
	741f7EiswxqM8iEK6bPrqcTUk=; b=YRi6KDILr6s5kfVlb3Z8Cnx+adtOadd2S4
	HufwslYjMlSnv9g4T1wP3Q9uBs3lmtm2hxvOaKuE2/+yXp4CCV9sGK4bjgVHfB3H
	KyHL04/q1of3+AdYecrpw0epNF+p9gCjyOVqI5jhTkkSXxvuvenHUx6Wtm5Hxwe9
	hJz7EIDlcaChboGALm36wjD+hzmQSNwlaZlfWMMgaQ1Afjig4kKYshVTDvYX6iFy
	qpj+I8ZQyw5DWTWfOOFj4rR1xl/PShSzsC8BscoMNuPyjzVKpouyGrwEdy97Eyff
	fDVvT/+uxJuRamEekBhblpluSw0purtgKSAZvC6nnbuOdaIX0MEg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc20cw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:36:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UFiwfX004789
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:36:24 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2vxtvh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 16:36:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiCgNBNxuhZg3pvPA9uDDopjnARcaXQ06rjK2gFjyHjV9FS6Om6iuqLvK2Eby0pOVGnbQG6xeBcWrjdmQD8OJVw6B5duya+uvd3nScItLkpIySl7gL7TMh+O4UfrxqVopuNMEwHpq/voCOT/PvozGH8wlzD8VCieRheqKhHpXIRBYruTxZMfRruAk4vAHIG9wrYSXo6k9SimoC3ytXmVN4bbFDLity4CphfPq1iByyu9IzhFoIcEmsY7S2OCQhcH5U60j8kJHUGvfb5qsiRKeKTXYNJXQ8PmVf2DKUDqurWzi1bbZ7U8NHcSYdMt0VrlOBqCHL/fUJSm8EjxmxRNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAuL8yudqUPPhgT5Wn741f7EiswxqM8iEK6bPrqcTUk=;
 b=U2ZpW+fsAek69D0894JXgUu0djieHSwj7sFrldgvXPXN+SAQZGPzS/DSdFVAGtslkSaMBWU7/F+cF9BHi9EBU6Se/K2WNgPsWlD0WeEO6PE+ZqmplDpT0mlBGmeQ1+0peMvZm7O9qDcsDdiwqvzMuGhJkjr8otM4P3EEGMtJiUXHuMPPRDULd/tqVZfehJ9OmU/yBRlu92do7pduUPMmHngaTVz82tTt6TqSGmNG6Wal1A6jGemkgogl+KhZ0OBzHjJSMtfDU/ZILrMl11ld9iuYm+Tw+behgwLxgQFjwyV9nJYFsDrXIo60mOZ1LGE0pYGCPlylW24P47yKt5pC/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAuL8yudqUPPhgT5Wn741f7EiswxqM8iEK6bPrqcTUk=;
 b=xULfxJzarGaAjsIMiaGo5QG4WgHVxOhOdFve+WiU+jPFqL2dlydKGTjbMSzvczR08oLNv8Qj+aM1ljiaKv3uMsViv9SuGe0gTKuqs9Ci3f4gWcHt7j3O6xeDxWYlaqlVKmQkDuizn//KQ+OQA5HojmQd9v7d63ruEWuVmwHlpFE=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SJ2PR10MB7812.namprd10.prod.outlook.com (2603:10b6:a03:574::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 16:36:20 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 16:36:20 +0000
Date: Wed, 30 Oct 2024 12:36:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 05/14] probe: improve dt_probe_lookup2()
Message-ID: <ZyJggd0Et9TiYY9S@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
 <20241030121236.257803-6-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030121236.257803-6-nick.alcock@oracle.com>
X-ClientProxiedBy: BN9PR03CA0930.namprd03.prod.outlook.com
 (2603:10b6:408:107::35) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SJ2PR10MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba7a6ef-9f63-40b5-4b17-08dcf900fc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZVK/KZTbcxiz31ZP5cfb38NczJhhim+rXiUmt29HibLoGyabH3KVoj48ZqCQ?=
 =?us-ascii?Q?lT6XAam9EqwcE9VlLW8SMiWMYru4RhtHvtHkI5Sk4w8/UAl/ObELn+w2pcR7?=
 =?us-ascii?Q?37nOmZARt5An1xZhDVlypZ7wakE6/F5RxmeTEukLA5NBKvwva+Cq0sQRw/g9?=
 =?us-ascii?Q?Z5xOEjH/isUSjNvV1wQHaZjiNoGFmbkkg7nMyjytcApYhksXKzMEK/p46re9?=
 =?us-ascii?Q?IhVNtVWD1UaBDhZr7dZogh3DqjbFTHYIK5yc9WATzLKGQGI4C1QYvr9sk1Y1?=
 =?us-ascii?Q?SxCe3Pn6qMQ2iur3gjT5k/mUe/Z1ebpbi0ngWUa8AjGHcSGJESFqFwQGe6rD?=
 =?us-ascii?Q?IP83w/vqdJPsIqahiDwVWOSPZ+lJ9hesgwA7y8G+mydyyyEnibQeFtchHpib?=
 =?us-ascii?Q?45ZaHcC8i849BA2EMVzG7j8aD9TUpHENTXyCsNiRQKtKOvTLQgZUljWFL91m?=
 =?us-ascii?Q?nYR/aW8apus0sBtmbx0o41sXsr2wGNwc9jaFeKFAN+9JWrYbRK8sGnppAz0V?=
 =?us-ascii?Q?5EWDhdqEDIXgSCodNmp1jGkrb/xGpwYGG5g96sw0tuKlgEA5056H9OHznBoo?=
 =?us-ascii?Q?3cq3uAg6Wcfm7a7i5k257/c6GbBCPHZPoD34jcu8wENjo7CeKe+Dh8yTTT5a?=
 =?us-ascii?Q?298msmt0sUVqEeJWhl8na0kw+BoDYv59Kjr54obSjzpzOxJ9XxSjA0blu6u0?=
 =?us-ascii?Q?JtlJOUSBARNwCSrG3crtjfov1/IUTDrxCEKEJn5qTGF2eU9xCrRK3ke4+aqR?=
 =?us-ascii?Q?/n1aWc+6qqOo8dvoXFOH9LvJIY9TdqX4zmYlKMY8pQzCQpODbADjgvqCMPMo?=
 =?us-ascii?Q?GF0rrJzdE6+FEA+A0AB1xKloYbtBQPtfpxn+yWHqHtKw76qyMr826G60rcEx?=
 =?us-ascii?Q?tGicCIut02vm84biXGA9cqhYpXpcXqX7fyJGLMacJ4MxftFTBCjGcP1h/txo?=
 =?us-ascii?Q?fGnziornXZ2lrkGR5MX4TPztFDTZ74dQ5PeO5WAcE8SwV6BdEEuBMH0aC00g?=
 =?us-ascii?Q?X4XIDxmzTf57e0Liz6BH87Y8b9OES7DuMqeXGQ1BCWjz1rbijEM4hLY8Qz/H?=
 =?us-ascii?Q?hv5IeDR+U59PCWKk8L6PUJR1cCK+fgNoVOPX3Fb7H6AfridEctI+twR88vNW?=
 =?us-ascii?Q?124C9XkEv4+bfM8LBHvJAMqAVIL6ALbQxgwPYG3RXhQOmvT6OsK7FZQhbe7g?=
 =?us-ascii?Q?F1MeSoKT6NS8g3cqNOFVgSwzGcmHLBXnRNziWND7/NucZ3lDXjHdZ+Jplu+t?=
 =?us-ascii?Q?8ZDnCNd+pM6zZWjvykTy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Z8pCc4eB90ZJYH62buW4pXR68a5VuS0ECA1at5hCeex17wIHeRLajXPuD5L?=
 =?us-ascii?Q?LZUCTm4G0MjVDVRYXqUh9BaIFAnxAnrtSK/xqLvTjs+Drlmd6ZP5X627/kCZ?=
 =?us-ascii?Q?YP0S3hdl6iG5HCjAu4eNMVLxwg4Utywn4CwzB0DTj952TWlKzE+icQkSs6id?=
 =?us-ascii?Q?1T7scWBLYx+9k5ekBSwmo5zPxA3+v693/f1NCCYS5x0xrY2oKg7003DQ/gZQ?=
 =?us-ascii?Q?c1V1IwgblV5kQjCfgKe8Dg/s9IC84CIUAHKq+80FXEaTe31y+AHZfObtzVhg?=
 =?us-ascii?Q?YvqLPdiJO9YWDsuLlWUteNXqLAm2aXwZlXlzSYcDGNpGendFtpB+h2QXuyGK?=
 =?us-ascii?Q?GeVj9kHyOMIQwHxc//ifSzosHuBYqIJt+mPN8LC3MPLUS+cp8fAlb3q14lf7?=
 =?us-ascii?Q?pRj3Wlox6DmABWj6DIB/8MZn/sAa2ilcg6GdFTFV6xJ/76N1TKh4QGKMzv2/?=
 =?us-ascii?Q?Pn5muHqu7RYo6/+0pNCA3EgilaaHI/zHXP7SPI2ykamcQsFm19JztQhIVmQB?=
 =?us-ascii?Q?AfJjucgxO/xuG83Z7NwHv/crRi9jqTMOSeDm2NrdPP37v41fyd6v0koliXma?=
 =?us-ascii?Q?O3DFs6wffAHuYZy1xsuKIhgMDi/2aW+x0kn9D6tmxKDmzwARetyB88+pBznY?=
 =?us-ascii?Q?dEIfd1iA4g4OIshKcpLd4MMi40aTiHhsoi2ss8s50zLJR4IgSn7h1v5OqaJS?=
 =?us-ascii?Q?2uJMd6uFXq9p6PhXHvaJAyxCgGmHcVeTiSxnsJDlTeTOrXASZc45+XwGMlVX?=
 =?us-ascii?Q?H3AibRqheeVto9eW6kX3AQD0DWYWTPphBm/tP32wLc/nvTPjUcvFoXMbwN+6?=
 =?us-ascii?Q?2+XvSWV+MfQK8OLIcWpdum5qCHNSPsdkUEiCvZN5dZI4jb3vv9Xm5gq138Xt?=
 =?us-ascii?Q?RtrSJH9ysqRpaZ/b/D36Y44ELST/50tZxV/FGLzawZmUkbxzamJIhrXbdGhJ?=
 =?us-ascii?Q?V90PW+ajOKkxJIaQW2aW9UDlsjPBnidCRznE2B28T5JXZmKdHFiUG1MyWrAT?=
 =?us-ascii?Q?JD15ZtBC+XPL9654wcZFLT87gIFh8Bsa9HeNecZAnX2yk8oYiXf8b19rC2Qf?=
 =?us-ascii?Q?YiFK6qmiu5lB39JxBUMUKyfhtRGRY8HSHs7FGDRTXPD41jSgyUcJ2Gdsgc+4?=
 =?us-ascii?Q?ka9F2tRFmORMdpHV+98kJ2jSef7ltAxeNh23N/Ids6sGfD2qCmpyCXAyHlN8?=
 =?us-ascii?Q?nlouwxeHSj7D3YwU80yF78ZWbycvj3UIst+KZub4wSb2EJH7++bPU4cpajtZ?=
 =?us-ascii?Q?Sc6DH4CmT3BncrJnbjjUJ0yKSXjYOh6hG5h8Z3Ru16jz8M8M/A7Di49h7QEi?=
 =?us-ascii?Q?bE0WX9TPP4ix51I++728GlKQLQi8qbAMBCsFu5oj5dpgAxWmFsFW6naYZwcf?=
 =?us-ascii?Q?TFgXSLp5j2pJByVV5ix9pttGsb361sOgkbaXl7zNQpVl044AIEpEcnkJdein?=
 =?us-ascii?Q?Cq7bUCRL7A/jGfgZZtUDjXGUWeX0Rv79LgNMjJY7xiVrSB2hQthsNZzu87WZ?=
 =?us-ascii?Q?Z8AOqnaMbyTWvsvXHDvK4VGJvrVuPw+eXUans4dHqudqo2tpVVamrnqZ9O3e?=
 =?us-ascii?Q?HShTOl3XBCzHm0vdIayXn/EDDnuN9hOXmp5VBmy6g+KkxvDMU0pbdq86O/GA?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W3KFjsBbvPi959+TjmDEN//+pP07PJI0kXILRAO4sSfy/+z1hde4Fpv7fvUYa80ESrfNSLyIW4DHr9dxMsuwNLyP37Hfc80Gpw0STVAJfC3GfzW1VroDuiRiu277gDEAUAYxlkMqaWe3mCpa0lXxbmzyxGwYdDDnmRJQhzLxL65YBL5jN8HKWnXRRkTjb0TsLa12c8+NbyicXj38L6vJqEGam2mi/lZPlAORCfQWDwKlCLnPEadRUSQvGNMeYibBMThIyg1v+1k05vjdcy2i1swC4Fy3RCLl1KvRT/ssKmZ1lsn6qwq60YCy0MMA5dEdih9RizyIISCiOXRhfuqZdOC2WwFRowrPK54315NQ7EhLN0VyJUuIa3YI1Q61VpMc3ELfddmcuJ6vL6edD+LjQIy+6Ga3S0dq/Hv/QX8G2/fgF0y6iZprB+fm8p9RIyDdh0BJvhC66lBiBRTKFPwWJntoU2olOU+Q7a8o09bt8nsYGIpv1Ybe9tivmpVDirm1UGJfbDFp98tlXLVamAICMknKOkAa2gyy/EIElTBCZtvlnPSN/2oFQewrN/Wi3EadVIVqxyMR41SrCj+IWoLE7/L3+hVgep4qS4CWlbGm96U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba7a6ef-9f63-40b5-4b17-08dcf900fc21
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 16:36:20.6693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMfE4BCFt2SPLetCxmH0PAq0SA1zze9vYj79S9tUMDkNTtg5POmB1FD7FcTT7lJpUXi+3XSOtdLF0NOE/QSVrZtYJJG9Dn1jiL6+RVIawAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7812
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_14,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300129
X-Proofpoint-GUID: mZqHnAzIV_zu2ogMKoCB-hHlUQZOwZmv
X-Proofpoint-ORIG-GUID: mZqHnAzIV_zu2ogMKoCB-hHlUQZOwZmv

On Wed, Oct 30, 2024 at 12:12:27PM +0000, Nick Alcock wrote:
> This function had numerous problems:
> 
>  - it broke _FORTIFY_SOURCE due to using a function that snprintf()ed
>    with a size of INT_MAX, into a much smaller alloca()ed buffer
>  - it claimed to call down to the dtrace kernel module for a probe
>    description (long obsolete)
>  - it invariably leaked the probe description it constructed by calling
>    dtrace_xstr2desc()
>  - it did meaningless errno testing to determine whether to return
>    EDT_NOPROBE on error, which more or less led to EDT_NOPROBE never
>    being returned even though it should always be in this case (there
>    is no other cause for the ID hash lookup failing).
> 
> Fix the lot: while we're at it, implement a dt_desc_destroy() to
> undo the strdup()s done by dtrace_xstr2desc(), and use it additionally
> in dt_probe_destroy() instead of an identical sequence of dt_free()s.
> 
> Bug: https://github.com/oracle/dtrace-utils/issues/78
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... modulo copyright year in dt_subr.c (updated in my merge)

> ---
>  libdtrace/dt_impl.h  |  2 ++
>  libdtrace/dt_probe.c | 47 ++++++++++++--------------------------------
>  libdtrace/dt_subr.c  | 15 ++++++++++++++
>  3 files changed, 30 insertions(+), 34 deletions(-)
> 
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 340dc1960c5e..5d34072042e5 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -759,6 +759,8 @@ extern dtrace_difo_t *dt_difo_copy(dtrace_hdl_t *dtp, const dtrace_difo_t *odp);
>  extern int dt_consume_init(dtrace_hdl_t *);
>  extern void dt_consume_fini(dtrace_hdl_t *);
>  
> +extern void dt_desc_destroy(dtrace_hdl_t *dtp, dtrace_probedesc_t *, int free_pdp);
> +
>  extern dtrace_datadesc_t *dt_datadesc_hold(dtrace_datadesc_t *ddp);
>  extern void dt_datadesc_release(dtrace_hdl_t *, dtrace_datadesc_t *);
>  extern dtrace_datadesc_t *dt_datadesc_create(dtrace_hdl_t *);
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index 686e2a661253..189bf7928e14 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -172,24 +172,9 @@ dt_probe_alloc_args(dt_probe_t *prp, int nargc, int xargc)
>  	}
>  }
>  
> -static size_t
> -dt_probe_keylen(const dtrace_probedesc_t *pdp)
> -{
> -	return strlen(pdp->mod) + 1 + strlen(pdp->fun) + 1 +
> -		strlen(pdp->prb) + 1;
> -}
> -
> -static char *
> -dt_probe_key(const dtrace_probedesc_t *pdp, char *s)
> -{
> -	snprintf(s, INT_MAX, "%s:%s:%s", pdp->mod, pdp->fun, pdp->prb);
> -	return s;
> -}
> -
>  /*
>   * Lookup a probe declaration based on a known provider and full or partially
> - * specified module, function, and name.  If the probe is not known to us yet,
> - * ask dtrace(7D) to match the description and then cache any useful results.
> + * specified module, function, and name.
>   */
>  dt_probe_t *
>  dt_probe_lookup2(dt_provider_t *pvp, const char *s)
> @@ -197,28 +182,28 @@ dt_probe_lookup2(dt_provider_t *pvp, const char *s)
>  	dtrace_hdl_t *dtp = pvp->pv_hdl;
>  	dtrace_probedesc_t pd;
>  	dt_ident_t *idp;
> -	size_t keylen;
>  	char *key;
>  
>  	if (dtrace_str2desc(dtp, DTRACE_PROBESPEC_NAME, s, &pd) != 0)
>  		return NULL; /* dt_errno is set for us */
>  
> -	keylen = dt_probe_keylen(&pd);
> -	key = dt_probe_key(&pd, alloca(keylen));
> +	if (asprintf(&key, "%s:%s:%s", pd.mod, pd.fun, pd.prb) == -1) {
> +		dt_set_errno(dtp, errno);
> +		goto out;
> +	}
>  
>  	/*
>  	 * If the probe is already declared, then return the dt_probe_t from
> -	 * the existing identifier.  This could come from a static declaration
> -	 * or it could have been cached from an earlier call to this function.
> +	 * the existing identifier.
>  	 */
> -	if ((idp = dt_idhash_lookup(pvp->pv_probes, key)) != NULL)
> +	if ((idp = dt_idhash_lookup(pvp->pv_probes, key)) != NULL) {
> +		dt_desc_destroy(dtp, &pd, 0);
>  		return idp->di_data;
> +	}
>  
> -	if (errno == ESRCH || errno == EBADF)
> -		dt_set_errno(dtp, EDT_NOPROBE);
> -	else
> -		dt_set_errno(dtp, errno);
> -
> +	dt_set_errno(dtp, EDT_NOPROBE);
> + out:
> +	dt_desc_destroy(dtp, &pd, 0);
>  	return NULL;
>  }
>  
> @@ -386,13 +371,7 @@ dt_probe_destroy(dt_probe_t *prp)
>  
>  	dt_free(dtp, prp->mapping);
>  	dt_free(dtp, prp->argv);
> -	if (prp->desc) {
> -		dt_free(dtp, (void *)prp->desc->prv);
> -		dt_free(dtp, (void *)prp->desc->mod);
> -		dt_free(dtp, (void *)prp->desc->fun);
> -		dt_free(dtp, (void *)prp->desc->prb);
> -		dt_free(dtp, (void *)prp->desc);
> -	}
> +	dt_desc_destroy(dtp, (dtrace_probedesc_t *)prp->desc, 1);
>  	dt_free(dtp, prp);
>  }
>  
> diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
> index d6aad7637fb9..afcdb733d26c 100644
> --- a/libdtrace/dt_subr.c
> +++ b/libdtrace/dt_subr.c
> @@ -175,6 +175,21 @@ dtrace_desc2str(const dtrace_probedesc_t *pdp, char *buf, size_t len)
>  	return buf;
>  }
>  
> +void
> +dt_desc_destroy(dtrace_hdl_t *dtp, dtrace_probedesc_t *pdp, int free_pdp)
> +{
> +	if (pdp == NULL)
> +		return;
> +
> +        dt_free(dtp, (void *) pdp->prv);
> +	dt_free(dtp, (void *) pdp->mod);
> +	dt_free(dtp, (void *) pdp->fun);
> +	dt_free(dtp, (void *) pdp->prb);
> +
> +        if (free_pdp)
> +		dt_free(dtp, pdp);
> +}
> +
>  char *
>  dtrace_attr2str(dtrace_attribute_t attr, char *buf, size_t len)
>  {
> -- 
> 2.46.0.278.g36e3a12567
> 
