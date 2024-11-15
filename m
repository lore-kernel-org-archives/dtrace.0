Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1841A1DA23
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731704175; cv=fail; b=N1XRN8IoFiQTQCKsZDSfiZO21HTAOr/LWdYqcdGLcdgMvHzfzjfaeN6lc/HaYTT0/HZhgTujKNLv+b5aalLGKBV1F4KaaJ//37Vuv8aSnSDq6nYvhsWv1j7KCZbE2fKSXytzNOzM5TCy973Wk6QVNlKTGJeQqfGxdov4Mk8MCVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731704175; c=relaxed/simple;
	bh=2UbPr4Ug7nRTnvoz9FZlRnkVOelc9e2F/oBjkGNLCM0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=LYFS3Jw683sDYinixAeAvXsOUfeuQCdiLOvWPojKgYvIMhxgFfBYp382OpS6xGhonfqbOBtU2uOZGAiOgjPbsG2Cbo0+gUPmxPxsG6Tb8SPSq+LkcdmmaZdnDVG+ZVAwV+ymSMDlpFGcXcE2XfuXlOSymBFcRnuc/JmmzF/El1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JLAKZI5D; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PxkJzlIv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JLAKZI5D";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PxkJzlIv"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFKMcMM032124
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=2UbPr4Ug7nRTnvoz9F
	ZlRnkVOelc9e2F/oBjkGNLCM0=; b=JLAKZI5Dsg1F994NUbszrV4qn2Q2vfCn3f
	9ylOJ+QLttMZOsgPQXM2bqjJkOFwhNlMSLbdtuk01Vw9wkJbbzC0p6Cc4hIGpoNz
	r3CH0VvpqZEPz/TZhfiA5PPc1OUwUuBaepzjf+vOZnpiAcFbQLSWpvU9sq7QiSyQ
	baauXzszYBXVNDdD2MoU6xALQu8aFrcss49iwnu2c2P6IbGBuCxkJX2mSJ6H5Yt+
	6DjupvkjqIwOakp1Yn8lKKLGxHpqsYvFKm0R4sx6isw9FQv8nzYMtjfy1NByg4ag
	O9lRce2ii3AtDqunzQsqLUUBHJFy8ckjL4knwEWPIUJy9+KLLi1A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0kc4ar9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:56:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFJ2MIs001241
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:56:11 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6d2jx1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 20:56:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDdTCwCmQtl2eu1PGYNyQpKXXMWEmY9aYtXahQyQgk6MwpOS6DAIK3wIwStomFZmXd7MrecqrQWqYa4H3BuGShbMTRzXhabRaIJMTDVEj3A6vzPe0+1trKNy5YtKCAhXsUiGtbdMoLoTl+mqoEmoJpwuQyPfxkxithY2tE8nL95aKpiGQKUgozU7ktPxkqXBzExPqMmO7WJMEuhpwhmchAavWd/EsX+rGaht7/1BiF1RuV7iYRjfay2s4freoumDSmPx8rUGGvC4wHwI7Zj91S4A+5Qwjwg70znBiTi8DznsMERg4UQ1C0Me/TpOVK6SrpfTdqd6e1SzZf4G6UxDWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UbPr4Ug7nRTnvoz9FZlRnkVOelc9e2F/oBjkGNLCM0=;
 b=E8OxR44oZzAMZJMcBchz1zoydocMV3HDi1xe5b8oGnluqC/xJfdVs6v7sN1mtvxAUt+IZih/AXjiYsAjNOtwCXH/pxiqd9KjDpIYrbGWiAReul7Jo2QswODVjOPnvEHSgmerY8s6x6K6rfKMECuE/az6jak1GyG9USm0f/yMbUQuwYZ8NKC6fGwNz/KrsiChwBAhLvxLqpW9ZfksiPllRsB0wfQWUr0zCOsYn+9Nf6wrW9KmRmxWHzDpCvGwlrnIX08uvEYC4srbuPD3UhOiCqUnbWcjLl2UJeqTe1DNPmQEPNkOA3lQOFuqCokgCHBmueKIQYcFjTE9n57TBauj9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UbPr4Ug7nRTnvoz9FZlRnkVOelc9e2F/oBjkGNLCM0=;
 b=PxkJzlIva5fQ90gcDiUYJNGuTfIXA7mnRXBs/7h3kiAALbyZJc741jHiOCRtWjKmn+wyi+9/PsY3sKp8ZIM5m9aCpTHndqaQ39jIfBC7vYrquKawvUmqLrLqwI0gqaOUMhbo9TA6RqyVMq/2ZpVEfMQmBirfbWbjh4uEBCSD2kg=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA1PR10MB7447.namprd10.prod.outlook.com (2603:10b6:208:44c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16; Fri, 15 Nov
 2024 20:56:06 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 20:56:06 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 2/4] runtest: detect coredumps in more cases
References: <20241114220108.95647-1-nick.alcock@oracle.com>
	<20241114220108.95647-2-nick.alcock@oracle.com>
	<cac0ec2f-4586-191e-a295-ac660c54f62d@oracle.com>
Emacs: the Swiss Army of Editors.
Date: Fri, 15 Nov 2024 20:56:04 +0000
In-Reply-To: <cac0ec2f-4586-191e-a295-ac660c54f62d@oracle.com> (Eugene Loh's
	message of "Thu, 14 Nov 2024 23:47:48 -0500")
Message-ID: <8734jstdwb.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0047.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::14) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA1PR10MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 56658430-ec1e-42b5-4136-08dd05b7ecb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PbDGJG8pNK9mU8/S5rFQw/y9ULXBSNmU0VOZ7wyeWqnCxjcPkg6+U5s7h+J5?=
 =?us-ascii?Q?5C5nAICLHhX5jBW3MgBZaW/T446AYNrJ142jemT3VwYF0awcD0wvnKCRT3Af?=
 =?us-ascii?Q?u4s4WyVSIddxvq4NNYIavT/PAtCBs8DCPawtZLw61ZHMiHE0KJcP67XlIKCS?=
 =?us-ascii?Q?05NZpjybi4iNIcI4ZQKFUNTMzGPD9rUAkwBwaHL7B75Z9vYNMX7UMckc/P7V?=
 =?us-ascii?Q?ORRSmj3XllkVz5mV6JIYKVgjQnSDqgB99jA81o91nMFBn+23NzHO0iTWvmA/?=
 =?us-ascii?Q?eYj69srLOJ69cD6EP8afHdgqPkRy3afZLWSu2l0U6t0hqGkCxme94zFznF0O?=
 =?us-ascii?Q?bLgFC58DUXgWrxRMC+HVWRZmwFe4I4vySppRMh+Vi7719jrc5B9TIIrIDCfS?=
 =?us-ascii?Q?/rU9VqYgw5ZDfqrl4wRoad8srJMhaIwQ6+AuDoxpcwk9X+8trTuu6zBO3dDS?=
 =?us-ascii?Q?mXQ9DIxe++B8tts8a0x65XZQXWnZhN6wvELyyZ7dkIxecDtbyIjnrle18FIQ?=
 =?us-ascii?Q?y0dsIJZzGpKf5FB08DC9KR3QX2ydX7WmtLvGzUTibgTDAENsUAjSa6lt0iqv?=
 =?us-ascii?Q?kq+AgupV4Bwrco0RTJMij8f/YKft+vYVygF7uf7qz1zAiHieurNTQ3j/SEiH?=
 =?us-ascii?Q?KM4xMURwEErBx3soyZ5LT43nTzjio890meY7z1QYUSIjYMiPao/nTWwt1uh6?=
 =?us-ascii?Q?js2neCJ5mOOHVRcmNc/l6e38vFMD6uTbAzD5/WkRO29fis+rN/M6oK+tGFQP?=
 =?us-ascii?Q?TPdsJ9bro2U+2mNrJtvCeC9L6CJPYe185xXGEkbNJ2lM4XjlWRGSIDx4CZNV?=
 =?us-ascii?Q?J/YZTK76vqtwyQfl3pBoNjLSJN72MXag9tILmX28s4QZ0eW0QdVYToxK13GL?=
 =?us-ascii?Q?yHFv189T2U0cz6kQg648emHEo3hnTHCwjYqELonB+Fz6nYIJd67k0z9tCny1?=
 =?us-ascii?Q?TQBpWPOlICYKF+RSskJxlAeZj9QNQo8TSOE3e+HEKFSQuFKTkwhnqeGC1g38?=
 =?us-ascii?Q?5GQCzPuaOT1ecG0cPQDHNFOoHOUMftlJRinQ+6Gj5DLqqhj4tUeHOxxwP7Pe?=
 =?us-ascii?Q?nSa9oCNp1qnzywznQ720EWWmbrQBQzDOdp8AQzrimW4o0UGKNaRXTmcb6SDG?=
 =?us-ascii?Q?y3UJXKckBUmMiwIqwb/Aq9tS4ctIHNMhW8ExJi//ALgAE8LSyYzGsZ0CiYxc?=
 =?us-ascii?Q?Ca9LNoFDoe72j7v06P4kCV2YYYk/J989kKsWAPvEp+OnNMzffvID90WnIZBv?=
 =?us-ascii?Q?qCpC0yEExcMzk4gamklA/dLrY0FLUVbjvfRjXjAhOoJT16kbJ+GbgcLCvkmm?=
 =?us-ascii?Q?Mz8NueOHXXi2SzfEyUDxYjEc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HDBzDawZTGNobybjfIk9ytL5kDTRJSdeXn/YgLaT7IwXuMqLtpOGfPbKUGdZ?=
 =?us-ascii?Q?jCFQli2xHjxuod/NRoNDJXnNYBxpOLkwXFj9V9wW4vPHuqRrKlrQhetPZdVe?=
 =?us-ascii?Q?obTc3TNeXHc9WlsAeEDFW83r9UdI0FEHp7YsROzTgo0dw8pa4npltyeiqbAj?=
 =?us-ascii?Q?yK5tNGyvZtJYDjWi16bUwYd5uUy8o2kDkS5syX5ufhktufG92PZ94E6Af2vj?=
 =?us-ascii?Q?j+3T1XFQ16lUZQmVg5Np20cjYqXfVcB6D7BqB1ForuAd1Lw0AQilNEKGQzaW?=
 =?us-ascii?Q?d9R1BDgetCoPKmT6Y4h82cHeiHfeB3znRm2H8c2c+VsbsrzYec9kn1UV4DdO?=
 =?us-ascii?Q?nOm8hPCNcvpx7t8bvomZ7UHjtYIJVASK4/GBP2GD0yFcFXgRQMh21JixhhgY?=
 =?us-ascii?Q?54d6wfToG/Rvp0wC7Si19a7tFlBAdC1hZoluwHGPUhXmoyIe+2Zg7r4TpwJY?=
 =?us-ascii?Q?3/odN0Eegm3edLMxaTM38s+nixbua1eLdAPc0/1ZhvF5JnG45wFipSZwwHNZ?=
 =?us-ascii?Q?WmOFzV848+yu4kxieF+E5DWNjx9kT3ezDKsrLSDS2Ji2Ta/rqHF34OtrrQK9?=
 =?us-ascii?Q?FtG0geY0Zk2dioWaQSQwfgZ8dlmRIny/WN1xQPXpvYX5Lsvnj1bFWRvi5XBH?=
 =?us-ascii?Q?lF+UaKh86jNMbxsr9LKBL2RuMhYOpUpS+VNEjDPpOqUFz/ZXBVRxmpF5WsMy?=
 =?us-ascii?Q?WtCW9n5tyRylPuuMMbE2GoigvOvXuJxZGL2gsGvBV1VDh+6oIBSezH1YXI3V?=
 =?us-ascii?Q?OOKDGEKGwyF/CjwP299gWE8lApx0nOspCrjl4E74Mwq1my4TUd59xMWTv78W?=
 =?us-ascii?Q?z52HqFFH+IQbmItF0INg2bJTJ6RxEU9m/xsC1DR4D70b/Q97bgvBdfbPKrFd?=
 =?us-ascii?Q?bRimorDGTeRyFPn6b54JaVD96MeCmSJDZzR6hHooFpIY9RKa0Xu944VkXcVL?=
 =?us-ascii?Q?zvk0pfQM3ZA7HU1uF+TqbLrIEM+of7Pp10eL5O5R4jle3VbHKoRzTxYqu2HT?=
 =?us-ascii?Q?HfuJ/U4wOXDJreR12VlD0D3LoG6kXE5XCQeWCMx7NOmKwqaeAkrIc484AqoQ?=
 =?us-ascii?Q?u3X8sLEV4ZI0SfS/hAuS/a7JXvQaG3G0cQZbvRTHQg/Ye3UN+pYfGmcN75EV?=
 =?us-ascii?Q?ysvwqZuVBL6i0T+2OWJAZzZR4gLt5woke215kGa/1SIdz/nN0Ffn2cOEwF67?=
 =?us-ascii?Q?7w7VbNzLBAZCbPL7qPiQw2HvcI9xE29Lkv2mufllMkHU+Y/XdG1T24RiMbqk?=
 =?us-ascii?Q?64PjWtVHQFIS0Sr5rm5ak7p7gw5IrkNih6yPTsWuagH7NM9eDGEAmdB6GrIb?=
 =?us-ascii?Q?Wt+BGu1DYVShXZuwBE51CjERDUHtsVWCv1SLv/ok2EyFbSfqkk7yRppSaSIN?=
 =?us-ascii?Q?wFkJQawni9Jldo8qbXpbN2yZRBokKMdn7Ql5lyPuBIWMXZ+aoc94a+3uCeOM?=
 =?us-ascii?Q?RKbSw3+ryMrY+WbsDkDidsQGGI+TTuKpyr8/MIoJ6QKhY7oZ1trgagDQnzYz?=
 =?us-ascii?Q?VhM0D6fI4cVe+R4s1p6GqdUOiT4CR7bMNENVqkG7xs6c3434HRyPD2Owofaa?=
 =?us-ascii?Q?nZeYlIAm2MWdG9fi/yz4B8HF3xP/HvCcVLQxC/5Yu57GBhZNU9EKHdrbFzpR?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LM3fFVh42brsg7hu8Yih3HkED5ZdDGsYnCExKRYnHtyTkSIt+m6kbGnICHIVQvOroTPlnpw+10FlGpZ24u7ClaGupUL3T9osS2yE7FN0GU4nQoMu4OFJa0O3xCLiYm/7ANpqyQTJ0c9pKHAgsx1Bf4Aun6D3MAR2EMuXJ1TLmNioXsG8+7cYlt4ptVc9qB5pxU1iHo1mxFRT6lCCpKFGVHhSbCeR+V0Uo5xnxLL/t1CsOl5X/JdgbAPX7qm6eLcB+5f41Lwy3/0I1tpHdEWy/3kslSP2BpKqwIBu6Hnjfhe7HpNAboTMMUXzceQGCP8K8ahO3wNHwgnroqCMoRZsNbA2HQwTN2waW6jhjInqGBJG+CDeS61nv6O4FILVsRUJUQ7RyBbd++BueT4LOu6hLgjMSkYfLP7SKKT97LPVbgA76z9ibP0A/3LvD5OTr4rY1yavihoG8Fj/1HWBtiRRMYemHFLOvbBkPzIU24zp/oecF7JuO39/RMoRCSDsZTeN4wRAyaBaHikkoi9UO74GGNW346dkQUagGODlHbaPBO7EPunMHP394c1oHccNcpxMIdd63ImOChwuFqooBcBrjETN2g3dLWAZZfiJmNRrktA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56658430-ec1e-42b5-4136-08dd05b7ecb3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 20:56:06.5867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0+hwGyf/1vdi9BYFt3KqbVfCW8iOu4rWud4b7PH8BDzr8KJKCCWtSRzGS/TZPNO1RbQRzXuC3jxrU2IK3y68Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7447
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-15_08,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411150175
X-Proofpoint-GUID: RsrKt89nZDBdZetwZSJo7IMM4QPKXTDi
X-Proofpoint-ORIG-GUID: RsrKt89nZDBdZetwZSJo7IMM4QPKXTDi

On 15 Nov 2024, Eugene Loh spake thusly:

> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> though how about for the commit message (just guessing here) something like:
>
> Exitcode 139 == 128 + SIGSEGV should be reported as a coredump,
> even if we can't find a core file anywhere.

Oh, I had honestly forgotten that that was the origin of 139 :)

(It's gone in now, anyway.)
