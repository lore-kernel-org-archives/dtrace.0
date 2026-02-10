Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A185B277C88
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756607; cv=fail; b=JIlFgjrqKYL8kgv8goYBYJQpnX4kUC4VkMOrvpiyMOIJd13aYnxi4M2TE+Ym6iblr+4jB66mUiTlhkBu+NT4+M2qE6aU4z3wDjDek2jHAZ9tVl0nlFdK4NNCX6s1C3tUBU4ds6OSO30fn2rj0mRc9o/bx4xXmRJz/Oo2MCTXWUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756607; c=relaxed/simple;
	bh=cFuWR9U2O8hIFUqOj2EKPvJiY2hwkORdRXVKtwtSFWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IOVIfRXjOv+kdAPuWOLlFZz1GYC2MXs8UvYGa98tg9xyWR4nRtmtqkJTrZ5ImKVx7ZU0aF5C3N8Ti6eARfKFGXSTwQVHuMPCnFHRx0wkjqiq86RgFisDCWvWVbp5iF0EeBRme8kcyRo4/cHDNaWhrDzmGM7zAklv5Zm/9gq1tao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PIsHF5po; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SFqBUBUP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PIsHF5po";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SFqBUBUP"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A9v8ob3997887
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 17:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=W3D9IIfYNH2JPS4n79
	VtFY+invD+ylbDWu+icYZuGBQ=; b=PIsHF5po3HCnZTO1in1J2leIJVcHWx7Kj+
	4DQrOA8JNaZMrc8b7bgYVrDmLI6/G3KUWblzpM7uFLYmSOhn0tbJ6/cnJYOaahZF
	sYJ3dX32Kod5aoM+C1SnT1CLPTLNbduh2DlgnDbZVE1ypKDkSGZ7QXyeIJR4E8JU
	mJoMGigN/1SaKEUo7xaumSjHFcDV1vW5wjVh4Ra9jobkyFH5a/nW9qEbqYeCvsPa
	zdjBrxLdLJxL2jTpO1PgtiuwKPOkk8UTqpjzCpKiD3b9LgDLZOM+77POielnDp87
	I1OTbcW9ILfcveHjuTDT2GX/ERoXtUwCGSRdh7MWGRYBCmSr78qQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xfp4gkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 17:26:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AGGXsD022690
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 17:26:40 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011060.outbound.protection.outlook.com [40.107.208.60])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c828a9unp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 17:26:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/uw9m/xXNUu9al5t4c7bOrmkgV8vLR9CvyWRAN9sbyJ53wF3Rk7Q+nd+CCkv4Zm4TYc6JCN8MqpG69/S13YwbmEIRzBbheWPH0P8CKnvXXTxEcOwx2iCfrB14evbPNCCIoAre4rHkmgyVdF552Xr4zV9VctC3sU6BMAkpnUlZj152NEeYFHikjyDJF4rKeDyQ8xfGwnxFjCh9YnPNlENY6pmr+GsTOYvLHmtmzKKOK/qn7+w3EhR6Rl2UE15CmNQ5KQpHJC7P938YNW9Dz/RAVwnqJO0uL7D/9xIXmYA1CmGnExYF2aKoGSWC7ujTSQyyyMvpqN3S+UeAhUdWRdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3D9IIfYNH2JPS4n79VtFY+invD+ylbDWu+icYZuGBQ=;
 b=Od38jUBJ42VFv5TofYhgojBEW5rcR1JQRXel/woRcYiD9bLAdy4+V0wEUvUsxMjb2IUpz6yTt3wMdvjV1N78hHqtJ3CHNj3xPmQmsVGsNwrIK07ssNTAdM9ws9c8XLMk6h6YsGfii0OE3osJLbOgctqgoU6u8ZYnuD67UqOtza2chapYZH/DwfYlzAUhd5llMngxXfx3otMvZguRQ3uQ3m26T31t/pyoJvIarMmP5LHu2nCvHgUU6nOfVsdtRc5WY+VH4mKdH7JYeN4rZpWmGdIc8TRISwqApz9ypbLAXTRv2fGo/ro35x+wT1XyduaYJ3Uu4q+kvFOJRPqskAEc3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3D9IIfYNH2JPS4n79VtFY+invD+ylbDWu+icYZuGBQ=;
 b=SFqBUBUPFEZHASPmKZmLNJ8MIXlhMDbuIpFm3CD1q111SGWYlVoSKVw4UwEwEW/KXNEXkanWNbElEKcFZndKwVD7iSSq+hgX8SHLW77X7AiDfwUEF86z1cljUvssZHFVX455cmR27uySEICaLCAFji5nMw7HE4GNXvAIh6PhwmM=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CY8PR10MB6489.namprd10.prod.outlook.com (2603:10b6:930:5f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 17:26:37 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 17:26:37 +0000
Date: Tue, 10 Feb 2026 12:26:34 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] test: account for member name change in mm_struct
Message-ID: <aYtqSth5OjHleE+f@oracle.com>
References: <DS0PR10MB752267259322167083A85C80C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR10MB752267259322167083A85C80C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CY8PR10MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: bd206f12-9ee4-4e0f-50a2-08de68c98b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+T88MGdjYNt8vYHYHf8Wawr7a88+4vxs1+ueZc4t/rU39/ZTDlcI64P4eNUG?=
 =?us-ascii?Q?a5SQ/ciGEGOcR9ANXGqEzhRsi08YX5EvZCshg3z2LQuoBftI18ceds+l5trO?=
 =?us-ascii?Q?b5DJl9SATX+oFKljOriHzIASqDQpwUJOrObOV0uXQEwdklzlUu70xX//cao3?=
 =?us-ascii?Q?5p+OagCpGrs9FYPeTQHewF7nDPORkt+3nJNJPiYVVAVvHBd+Qz2CIiRltq1a?=
 =?us-ascii?Q?Luk33SFmtXNpAk17Q+Sok+mU+8A4Nte7Z4vYzSzSxDCudrBJvuU1CFTmMsYl?=
 =?us-ascii?Q?OcPVcBsQth+Vt8DV+rgIrW/rEjNUVJMz3OLlONV/u9yIpAlzwGrm7qCIeNGk?=
 =?us-ascii?Q?rp7IRCFzSDQrynW3Dde6Jg2fqFfIwxgkVhZrn/S5Vp/6rOBrv6+aDeUDFfxi?=
 =?us-ascii?Q?8KZH7fuOXO6huIdI9a66DFqfATKiEuJah266eXPFNVdASGErTZAmddsVKIUx?=
 =?us-ascii?Q?CbvCRmRw+weQyc615PMztC6VJnsYF5rxr00/IFvk2aJg0gjz/PySMFsQLzpK?=
 =?us-ascii?Q?JWSzAKigdoYspimPL9lzltkSK30z3lrTWch1G/KzIv7/vfuFDGBzDdGoCcf5?=
 =?us-ascii?Q?uF0jCnPC8ynVOMYtNQQhZX+tvXSYhjrK8qtGzSUYZWjJN9f2UgU6KeeZ1FVg?=
 =?us-ascii?Q?5VqAIpaiSdD9QAu3P5X6jSH/yFpDjSB2+zyhmpfBVT2i03rsoXwYXpNWpXSz?=
 =?us-ascii?Q?/dfG2o5ST3aNsNHfjmmN9FJ7q/NTSFrjS083YZw92UNlOFW4rul2hHaQoE7B?=
 =?us-ascii?Q?p7o/E+QC70zF/oLI0UgEoKwJXFC5PGXv5e1T2P+zE/LZZIkCOnK85Is0/Nt4?=
 =?us-ascii?Q?almHvEsDdxyHRfey4YHsJxkQC8DfqW/5xlWZSP+xYD6L+VHkG0rcT9pnqxwe?=
 =?us-ascii?Q?1YE1kPSHOOUijPW6M4jcBh4X6WO0BDjUSaZEXgggeljRxfl/6G65ikLwtk+W?=
 =?us-ascii?Q?1YMTaBcDslf7Xqgw1NWEbXsjknli3sb8Eo/ozVEE4/k2MJYovDkKLCcdXNEn?=
 =?us-ascii?Q?r6EMMo7koQ74vIMbV7LCYyTzPbaGdVcW6pAW4M+tEq6bhy1oCyi3uKjCk8ig?=
 =?us-ascii?Q?AV6Ye1eyDkCTgvBLMAn3hE9cqaYBjVmNPxRnRLHqJfZ6ik9ex3wm48zCMFo/?=
 =?us-ascii?Q?G60x10zlMxjnmkupx/kc9HzAQw9bxc2uahrMXsbJDrUzea2CKaz244aYy2zv?=
 =?us-ascii?Q?69oXd3mse3i+rLTFtZGpfv7qtuCMmF80LSk3mhz530pqSC5ShpI79NkQzvBZ?=
 =?us-ascii?Q?/C2BpXLm8llhfK79XzblZezGCZ0hTxC5Y/wCx1bZ5SczSMm85GQ5V3ia3OoI?=
 =?us-ascii?Q?XOhfIm+4gyH1p8++03Tx8q1YD/B2Zo72+0dc4crwm28xc2TwVyjbhAXMCeqy?=
 =?us-ascii?Q?jN91rcdfvXRmr3txNlVh51co5JDvb4Hl2enktHef4Ti44aMJeyq4RNCI5KuO?=
 =?us-ascii?Q?/01EMeZBYZnn+/6YifhgkwKlCKXhTwN7XsE983KNjr8iZEBj4ihNEKrc9ymh?=
 =?us-ascii?Q?Hdu6WCBrrqwHbqFB9KMtwklB2OMYszek+sbNB2OU50lwhwXOtMS4efIGVJeE?=
 =?us-ascii?Q?2+5eYJIG7mH1y4577oY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BWTDMHmsS5hdPKykjWeoXVLvSHp24sq6iICR0/CjEIu0ioWJ0Rf1vnXUoAOU?=
 =?us-ascii?Q?AuBGaMIyYDLR6o0gty7eOkP5ql0IQ9vlfSccUdjklZQCSXGsWC5zWK8Y8Kls?=
 =?us-ascii?Q?A2Po3jGXzGvB8C7Pknvt+n9Xq1gkAHkCDBC1ppmY6lBdgIZjWbtE0fU6/WhG?=
 =?us-ascii?Q?oqP0YZ1gse3n9SS60TbWCkOuZSBf5yGeQD/9RHLUcObWOxZNHep0aTiv24jP?=
 =?us-ascii?Q?OjGV2hD0RvdnENjg32BeG/NjG9C4lErA5JsbhWa7d8VTsx+j2nKcJphCSU7K?=
 =?us-ascii?Q?XspJ6+UMCfM5pr9mpHSr8Lo7WB3IwouZG/UWcBHE4StCYcnS+OSX8GHBFhGw?=
 =?us-ascii?Q?Q8K6imE33Y+qcy3DCNUnQ8ncGmuQtJdRgdmFyfUD8X3r94mM0B/XMaqGLAPk?=
 =?us-ascii?Q?SDee4b7znW3FDFp6dJgdYGCvwyAr7NEhzFCQMQ6bMQ1gnDlmBvumr2PHC+YM?=
 =?us-ascii?Q?VqiFHStb5iVcr/m3ALOiBlIkeBOjipA0J5eeZqA/Wc8cqUtj7q55Gqdf6i01?=
 =?us-ascii?Q?z2PE3I0SRkGg3x/i0svOFXQBLYrWKuOjdtJsba+7SENxVAarDkRCBisU0wG3?=
 =?us-ascii?Q?yH5YgSi87WoYvipUWk0qBJcmcH3esehsizyFiTCvHD+GTE8k+n3GRJ39rvc9?=
 =?us-ascii?Q?yhfcBec2w79OZOW4iypcLx/0aeDa5+rEdxQFqCwGyKUxgBsUTwwIwANpVocH?=
 =?us-ascii?Q?Te1Qg+s9Wfdm50ZW/TtJkLrntgXfBh8oypW5TGh0hBTuOR0IjFRlwOmsnRCl?=
 =?us-ascii?Q?KbTMvPKUmFfDA1tlfvAx0wGePhEeARsPKMms1IggGSKJSDPBWv7np5xncOOR?=
 =?us-ascii?Q?MnIb1D4+JZITiHIa5p2bH6ikxfRcSuZKZhOmVeAfWJV4xVhwZQRoTiyl9FGQ?=
 =?us-ascii?Q?jQYcG4sbGetJl97Z7GV00M1nIo0/0l8NpwZGVHtEHLGu2DSjNeOJJ3kTgr9q?=
 =?us-ascii?Q?c24UQ2zmf9JJjUFINLagymMhMeLE//07jY5s3VK+P7QBqnDxKnihlYKRYvfa?=
 =?us-ascii?Q?z1dfaaMD+RvoM9hWJAJQgfgVwpMU2zguATJAV0sYpXpP54Wufywe0KMbg6xM?=
 =?us-ascii?Q?WbRmHmRv9dNNHrectm4Og9UwiU4sfLBkskLoU3y9BNpT4FUpurwAoA64pRv1?=
 =?us-ascii?Q?wKolEzUM6HM+lr/+fYt2+IQqKqJaE/7fyfr5iAl8f4sibSRXKJ8Rsw+AwcnT?=
 =?us-ascii?Q?OgO56d6LxTKXZHDaDdhfPwIfHvNLUUR6MKI4x5dFdTCWlKdTNApPOXNLSnUU?=
 =?us-ascii?Q?xuVAZD7Lv/9Mt2+isgYCNNyy8PvoV89ZUtOm9T1HzPuC7GBikdjZmMtosWW4?=
 =?us-ascii?Q?PIUS5R4B/1zu1eLEzkytAgjs0oXssfarBuYyuDq3PAf4qhu/6EThrNk7eASF?=
 =?us-ascii?Q?LBU3emlwOvZL5bVrpHL5THArS1i9xIB/HKgTtU4wYw6pu7OCmqGPGa1weRDi?=
 =?us-ascii?Q?RAKof2w7T5Xj2FvEUY2l01ZonNHZBoOvq9bYGjgfdJ8imnhA5sOU2wuDPuPL?=
 =?us-ascii?Q?rUMkYTZXbRu40yVztaGPuY85BGSkRfLr0khEMxwI9m4FEcAr82CqCGG5OCbY?=
 =?us-ascii?Q?w4vjToQieNMWZW60FxoGz1yVVUhlg7hVkvekw30cRsklNGnLBMWM06vWrQdx?=
 =?us-ascii?Q?K81HvIsX4P6yOBSnzPq1yI0RxTOgZU7l7gIBTxIpIBL44EmJMg2fjKUqjeGw?=
 =?us-ascii?Q?U2AlHGUow99yipzxyY39UeBZUvJ0PLd1aCiEIrwsBcCA4cdQ6pwRyZT4c2WY?=
 =?us-ascii?Q?Vc8YQSW5MQRkVCWZRQI1J+jI4Bhj3Lo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zUHOPIEx/Yzgj8shKqM/A6Zdud6KYUrAgyHnFO28EEq3SFyQ355r516AEpWfOrknE9e3age5jtR6vJ6Pxg+lyd7mf1WiZnVPYdertZhAfZM++AG/4Oa9WMnPCeXemjPEU92zbMC4OcEK/L4uiZC/RHa4/ABp0EUOQRnhb/6hEDCuaR57MgfC1XZoyOhnEwfkHRNpsRLeJGjeXToqnoanhF49lD9b25KDPC75CTIZWvAzIh1s2yBt035GzJCccBoF1BVPQTtwN2GDGRLJTXLN6NtHFQAsWeWJgAQAzLA+3x9bSXivXotQ19EhQbK3ektHLNDGpx7yG1sCFzRVsJVFcrn8ZpqioKXJY7Nycd9SyMfQfoVx4OanZBO1Cemzx/ydCoMkkuTE7gs9YS3wxCe1+UF5gmce7xb4Vz6zUr9HNI2quKMBXOInUyTcNUsI/LBXvKN9iQkTuiixZQ2ayYpuFAmPlBAUiui3ZStPKJGYcyeHpYSqJy/YpFIyaElx7hfD/4EphmC0eXdisUcyW6K+d1zFgsceqYtQSipqauzP0z9QOdHqiTkDSQL8feT6rq7X8Zzv5FUyTjqWpH6hP9NDR97t5N5HVwE+rbKyE76r3a0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd206f12-9ee4-4e0f-50a2-08de68c98b5f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:26:37.0371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4Jun3s8nKoN9cA68MHrZpVs7UIIj28KgleRR7avUr32MKIZaf0722O4aW2cAmUkElZLKzSTes9+cFPPFDhzH/0cNc3cPs4XUrGUEnluhX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6489
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_02,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602100145
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE0NSBTYWx0ZWRfX9Ks1o9+JX0Mh
 YGaWWirzVCQe6GP4H0td2nTqbdsdIuFxhrpb+NubJALg9+xNvFeUNNm9myoR9TBDhsI2AENWxC+
 Akhl/Uz7szBCHHlZp9YFwJHWiTa2zEe8Mgj0dPG/ZdQ63M+FNLzChrvp3JCsh000AsGkMnIIdA/
 f4rMJI1VJwxo8vhOc6Y3pZBUwyrUmm2Sht6Adxf7Egt/E0Vh2QnVleob0Y4OsoEbTGEctxe871w
 csKYBZhvKjG3g5J079W7g7fIW16xcpCjdl8YR8Z5dYduwMw5KzW0E2ovBnAHbMseKOFnUbJREI4
 YlpVboESqgbqRWfrgUnuOWH8p/5ludEzDSvtZHZN0nq1W8BOMQTJ8k02Z65mNQaVr9beRTL+8RO
 E9iXohdELdbqquyJ5gqCM6TDJf5fxTDWFVg+yhJeZWrG3gr24o4zORv8eBtSitwoP83ErMXtOLJ
 sjEy/QfEc6J6AbT04mUt9tkgYd60I+oEK8zOJXGg=
X-Proofpoint-GUID: aFTtj2DC04p5tVYfyUH4NCBzYzHhw1QN
X-Authority-Analysis: v=2.4 cv=V8xwEOni c=1 sm=1 tr=0 ts=698b6a51 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=LAVoyfrL3mCG4TTf2qUA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12149
X-Proofpoint-ORIG-GUID: aFTtj2DC04p5tVYfyUH4NCBzYzHhw1QN

Woops, forgot to add the change to dtrace.spec.  v3 coming

On Tue, Feb 10, 2026 at 11:48:51AM -0500, Kris Van Hees wrote:
> The flexible array at the end of the mm_struct has changed name in newer
> kernels.  Rather than depending on a particular name, we can simply get
> the name of the last member (since that is there the flexible array is
> always found) and try to use that.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  .../arrays/tst.ctf-dynsized-bounds-runtime.d  | 25 -----------
>  .../arrays/tst.ctf-dynsized-bounds-runtime.sh | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 25 deletions(-)
>  delete mode 100644 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
>  create mode 100755 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
> 
> diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
> deleted file mode 100644
> index f3801454..00000000
> --- a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -/*
> - * ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
> - *	      (ensuring the bounds checking is also bypassed at runtime).
> - *
> - * SECTION: Pointers and Arrays/Array Declarations and Storage
> - */
> -
> -BEGIN
> -{
> -	i = pid - pid;			/* Non-constant 0 value. */
> -	trace(curthread->mm->cpu_bitmap[i]);
> -	exit(0);
> -}
> -
> -ERROR
> -{
> -	exit(1);
> -}
> diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
> new file mode 100755
> index 00000000..60fe6afc
> --- /dev/null
> +++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
> @@ -0,0 +1,43 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2023, 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
> +#            (ensuring the bounds checking is also bypassed at runtime).
> +#
> +# SECTION: Pointers and Arrays/Array Declarations and Storage
> +
> +dtrace=$1
> +
> +# The mm_struct 'cpu_bitmap' was renamed to 'flexible_array', so we need to
> +# see which member name the current kernel uses.  Since it is always the last
> +# member of mm_struct, we just use that member name, and hope for the best.
> +# If mm_struct ever gets changed to not have a flesible array at its end, this
> +# test will need a new structure to work with.
> +# are out of luck.
> +
> +# Determine the member name we should use.
> +member=`bpftool btf dump id 1 | \
> +		awk '/^\[[0-9]+\] STRUCT \047mm_struct\047/ { in_mm = 1; next; }
> +		     /^\t/ && in_mm { fld = $1; gsub(/\047/, "", fld); next }
> +		     /^\[[0-9]+\] [A-Z]+ \047/ && in_mm { print fld; exit; }'`
> +
> +
> +# Try to access the flexible array.
> +$dtrace $dt_flags -qn "
> +BEGIN
> +{
> +	i = pid - pid;			/* non-constant 0 value */
> +	v = curthread->mm->$member[i];
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}"
> +
> +echo $?
> -- 
> 2.51.0
> 
