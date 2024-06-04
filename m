Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4FA149006
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524725; cv=fail; b=DxaV35rwHl9cZrd9igBDlbGPcKkcD9N0QVcfdmk/GGA6q8bFKcL3gImtsBgE8wqCkuxZBZ80Qof6ZTiSQ41EfPfrju464C5BJ7aCGxnrFe6+S1padGLKwtwCiyvD6248XKL8n02AMwN+vPy07dInUWYD141IY1mX84K0uSsjti0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524725; c=relaxed/simple;
	bh=s0rtDrs22V0PVnkiTO4PLzmgirVHQ8FFq+8C56TMiFg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tkt9RbrPdjRuGUOvOWhFZdaPuW89O/KCx8oFd2TiYqu2JuYTddOtdEOSn9LDPWqfoi5kKlJgORc3tnXDI93/F+mJmcNwi5RgC5eUv68Fyyh0JbirFZCMdAl0r+Y/NxKhMKO5DwU2leI5S7gfCyy86O9z9gCXbUKo6CxT+odaCTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BoOa9000986
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:12:02 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3DbqAmx5E3xap+/xT?=
 =?UTF-8?Q?uphZgmJCiJcLbRAifHp4d3ggB6Io=3D;_b=3Df5oSkJgbNTPbtnd9iP4SkugzjJ?=
 =?UTF-8?Q?mpKrRQOK2e26DnGkXus/3/kd1UqU37ASGPsqWo+Poz_BXXlGRd7bOsj26Tv1Vu5?=
 =?UTF-8?Q?z4UuGkn8c8v5M6ePgdI3J8KBsdqe1fiBOTT5WpsfI5regwK6_gJqWz7bEdMg41A?=
 =?UTF-8?Q?A7SRV8C1W6eMt3ebPaiIg0r+GV/YRtCjTB1RISYspxXpabUhSNVkuG_sepy1SQp?=
 =?UTF-8?Q?Ry9ZqSZF1NpbXbnPATlxGtkRpF2ZD8lJHnatnOEZowwkUsSN1UeTWjGcNMCY_PL?=
 =?UTF-8?Q?q9SXeAKcbqZLHTltIZ4Pra2PmHCzcE6xCQy/UUGFhWMvUAOWB6YACvgUNFGAFky?=
 =?UTF-8?Q?geV_aA=3D=3D_?=
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv6u5me1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:12:02 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HaOH1025263
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:12:01 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrt8yyfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:12:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrP7Zd0ZPe94uUGp9bakbbgOLYVbNzvfhGru2x2W3ACxxE131KPn7TVPt7VBf48t7Oy9lsLZce3IHPGlu8P0MRy2aMa+lEROYLXYD/koh6zKzK0iwKtLAGl5RLb3fbrpPJX0J66qxRqEwdFVkn8/dshPp90atFtHlUjWqKdxu4aPTSMkhoWmxU51c8vORJ3HH5is9HiBeOpGgg5ut52numGLYrionX2U8NUmqXofAklm1/LJt76N+zFdDGhV0bO8QnjqukyX8XvkVy96GOMyOnpqjPPuE7z3o6pyBltk+JD5XCatQIzlWSbGMS/Fv3Cl1FB5l2TbjRETVAFxaN8r8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqAmx5E3xap+/xTuphZgmJCiJcLbRAifHp4d3ggB6Io=;
 b=KMmbuFVBsLBPDJ7xvkoWMFogdmvkJCYqTpGV5uAQJV2A+zMkU7Ec8ZV+kvX4Wgl8sYIUF1zRHBrJ4HuXNAFny+Mwk5G+8GeVZ8lY2fpP9132UabJzb4gcdllGjNIRYrX0PjBSaivuKEjxWc32ZoyrYff93YYb5O2kZ1PnD6cnDc/ApjUrmwGSFtIjy8P8ob54FPyH6Gzx1H8OzzR/0H8xvCgom+v187kwHRcmt6uwL6SicLSPhuvJ+5wMQLxfKWv+Jp3E0fzbiQMISRZ40uj1ajxu7pbvbqd7qnnF4lx+cQ1Q7Iqtl4RUoXMuJGuhk5Y2vrWYUhzxrlA8W9nwPC1Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqAmx5E3xap+/xTuphZgmJCiJcLbRAifHp4d3ggB6Io=;
 b=NwQYB/f9eI5ARJqDiKiGxEQG3rsKIxs+c5lskYrHES0OZN8pLrHEf5z3xTuTLXef8O7qBSEG93b6PIiyO1H2s4PS58ZUOlzDpq2d+09iT0vNLYTS9JJxdJeTZLV1PahtktuDakLBAFFyDepYpKWYpiGIXrZCyOH0DKsVGfM3Iy4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:11:57 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:11:57 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 11/14] Back out the previous patch
Date: Tue,  4 Jun 2024 14:11:10 -0400
Message-Id: <20240604181113.11505-12-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604181113.11505-1-eugene.loh@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: b59908d6-9a11-4da7-5f09-08dc84c1d2a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ADK+aZJAEtZldEjuxl1Sqt/TBaNSC2O8svgfwcy312f5az4e94mtjuTjH21v?=
 =?us-ascii?Q?U3+jYtrKkIAgM7NE5ET5pL3qrPL7uV+FJ88/bFR5IfmDosQR9ikIDw5emt1C?=
 =?us-ascii?Q?Ye+cQOTFQaoUFX7NiaF/r1elzGbp9UbFUvg6d9o8CkS+ouC9MMVr+bBJ4G6Q?=
 =?us-ascii?Q?b74Pzv0DPNJdkAQAEbTHKlYtNqgy9UtV89/HIUBWOtvd/PoAsS3SMz+YAwId?=
 =?us-ascii?Q?3gimEE5Q5mzhvLK3krV4RbFva2nBZ2nsbfZ+8GzANQUtsKEMUIgWNKHPj7AT?=
 =?us-ascii?Q?X8FKo5n/xWNQVdi6X321Of5LIMXZD+n7rVULwoR7hhq5vByigSsRg5+NEhFZ?=
 =?us-ascii?Q?u+UjldT5cuBrrmMVk8b8NBwlHX5xx1AuALCFEgcweuTXXeQ5pEnH/8M5PQQm?=
 =?us-ascii?Q?MszXHraVwFuqrIIneZVEoWqHN/hxDhjO3IF/UOmjbZeyDDgwe9JpMuwRQSs6?=
 =?us-ascii?Q?z0T+Ma2nMvifpOaST7C8ZoXaEIopH4/0FholwHJ49hEvST5ieyrfFwzvokCK?=
 =?us-ascii?Q?nNliKQyxD1Jd4EVw8nDxsY+EodTyjz0gVNZVcSX0ALKEwNsNk/sEyqJzr6Ye?=
 =?us-ascii?Q?aOEOc4O6MZxXbNWwaE8l4cH1QUCOnD6CYxk5VG09LVfPe2CHqh3hllyUZCzn?=
 =?us-ascii?Q?/zHT1VGlIF74ifnDhgL87HpgMFrFWW2UIyi01W6IOkEbIJ5Fo36hfrpHOi1i?=
 =?us-ascii?Q?as08i3Yv4MnUtABUcgQ56MP/LGPKcMMi6X2EslZWqmRZ3PG3zboEsJCjDTme?=
 =?us-ascii?Q?x33Y0tzERbQpNdxJycp7386bQFNMrURBAukyrqU7N0ecEENj9i4pVGE4y7Vg?=
 =?us-ascii?Q?kGgpAFiW4aurxXROfMnmFZx/wljiwOq7kjPSnfsU4Ar0Rc+uFZZAn7VZTpuZ?=
 =?us-ascii?Q?A5obgLhOZDdcsdcBPrLgbtztEe7vM3wwPQBts139kHgUcUcTu3gkNgMcKr0k?=
 =?us-ascii?Q?OYAu5hc4LTGGK1D2ZLPz3CWN3KqLV+ImLr3Mt1T/UnqXk61AYUnao9sohapo?=
 =?us-ascii?Q?/+B5ZMQuU+nD1sBWQ+duYOkjcmwPFLPUA2FEemkTPCfGGcel4qJGC1ipPZ9o?=
 =?us-ascii?Q?QNQGPyq1d4YwBqidPMY5H/KsHDojDLK6yqFoBU6Gex1JFVbTFSFHWX/vYMBW?=
 =?us-ascii?Q?/yygkmiVW/31T6ejVqWLHYcDQyVLB/wS4VRzkAcqjYckDmqY7hNoyFUjrBRX?=
 =?us-ascii?Q?vO8BPa/YLYbBV+qV9/odWZbSvvVjDdZoiLupfxJyHT9w7wJEBGge8S1c171W?=
 =?us-ascii?Q?h7E7pIrRBWsbn24FQYintAsemUZbiKY+5hbHmTcvGA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PCB+NhFebtKpX6gMxILk7L80PwhKi5r9H8uEqrwstxYHuTrS50OEblhlLssW?=
 =?us-ascii?Q?sw9+bFzC08K5fDaMbJI/TGTpczdhGjbOVJQW4BO22ElmkcFu5oXCUGiHxeaj?=
 =?us-ascii?Q?nRY1rhCWOLnoMfAPO8RpJbNAOIt3RSmwbSvGBgVMvW2CLMmRCceLp5IZLOYy?=
 =?us-ascii?Q?KzbpmvZucot71+HgfIXS0Eh7ITi6xjZ2O0fUkxpq9uNdTqkz4XoARrEeRyhx?=
 =?us-ascii?Q?+bsKKHuuCEOzVcwyoAkhDWx4SGivNnAhQwIrDdvY4hZ26TLuwG6plz82ICQ2?=
 =?us-ascii?Q?vMaTGDOW5fv+c3gpWnAUpGZG+aqaegozYx5grJv9SLSqlzZ7NS0erPjDExhS?=
 =?us-ascii?Q?Z+Dy889rqbXlwB9ptR09TnOf4Z9TdI+zvUf73VeROtE2M7XppqNY+mmBYWxc?=
 =?us-ascii?Q?6sLByraqJHHgHUsfpqhOYP0DDwBxCCeyHtIorAbksmXKZTd7sBxc1J2TL3wt?=
 =?us-ascii?Q?Ey6gyhEiz7FywzM7DrDTS3S+KbCd6ZAEneqUMZb5p781M0qHbuVJt2CBY75f?=
 =?us-ascii?Q?I0MvNOjkryFsZ5yUWGVEiaxETovH+NoWlMvXSTshHtWQQPxsh6AXY8TlNxTK?=
 =?us-ascii?Q?RZKE8QdZ4APn1nHkWZZv7L5DnZZkAYZ2ictDroyKiv3SNqUJN2AsYeA6WTpf?=
 =?us-ascii?Q?g8/8AJe9ZE4TwLKilfCSNto4lrOKTS6Xz6sqefi/2X/hQtftgNjNxUz2/B79?=
 =?us-ascii?Q?YdGMCicy76yMV3bdCEQKYDD7/B/rZPszC+G+G6Y/09uCB/1+I559A+Mf9uPS?=
 =?us-ascii?Q?odALgOdCkaOYVACC89554zkpHhKWQaudpdP0bN4CF7haZvmziyF3ZaMdyB8s?=
 =?us-ascii?Q?kVH7Mv3nBAYSr+l0UoymGQeP35dwSFw26YuJMNrTDg8+5WzvvKXN6e65Ftos?=
 =?us-ascii?Q?zD16xBz2grPRMi91Nggj/HUWaR1rEssLvzvPxNAIbCn5pi9KP05u6kQv6jKy?=
 =?us-ascii?Q?PiGPRkKxnR56mcSR1uErgp+mKGL4CUpP8wPiVbViH+1htjKfpEGOxHPQGKum?=
 =?us-ascii?Q?ZXwNfg0uOc44N0NwPZagUjcpjET0Hli4kk6UYZzj6SJKhBmsNniDjL89dtPk?=
 =?us-ascii?Q?KFzJHxf5USwq6/TjzEfHOYdXtnHOs7dDZNSHaD5NIuaOoa0rmKVU3c2WZ5Je?=
 =?us-ascii?Q?nUr8CzQm1eXhQQoVeH2uMwCsi5Ff879c1SmVU8wmnRjw7+WTicdyeJu77ucM?=
 =?us-ascii?Q?2Z6MEgJMUfjsMGb6N5tqd+WdStP/nB92VXDkHLrtNgZHJkSHDh83Ho8Vonjd?=
 =?us-ascii?Q?kcXYaScqEewZ04BvXxPYJtHul3yXV2KEGvfkNHH2sO03NItucCMsbmSenhsX?=
 =?us-ascii?Q?hw8RHbneuA4KC7U0X0GC4ukHGrjOldlzIypTrLJhE+3WZTRjsCyKxTV+czLZ?=
 =?us-ascii?Q?L9Rfk+ydPDlDBqq3odXlaejQbKyAIh14VA2XBJWNJWPW+d2D1CjVjA5hN6p1?=
 =?us-ascii?Q?dnqEU88pes78F/rk+Pf9+cRHbsgp7IvGRjMvJxu87tit9UoJNmw+pXjF8+zU?=
 =?us-ascii?Q?u9JQB3zB9Xytd1Oxc6UHZCIvmaMbs64/T8OOHRe1pJ1MIF70S13HJhYzcz+f?=
 =?us-ascii?Q?D4Gp3++CHy9S8vxwxF09HRVK/qi4FoJtFJaR89Jh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	RHo3MPRxcQEWcb8MoCd4eSVCjTdORG33kycL0brrMHUVXSZLUl9X1Jzo2T9vzdBEe2TFlebyt/uaSuSlKjzekuGslYdqHfMooydUweHxcoza9vkyi79cbIKpZgi214srblDgo3SV1pDa+2yOrGJTTeSlKY1fpa7iuKBhkS/KPkjlXoFATeV3ftPswSJugLeGEBAdw4mVtxjsoxdNx3e0gFfi7oqhqsAD4/KecIDh3qRHyVysubWgl7Adsu8qAGvG7gpvRVzA1ZpZQzPAZVvXHu5VqvNYZwRR3uXaH/m7VhN+ZvS6SZhwMZvJyN9+hK6ETLZK1Ph9LdhWxtRok1cUuQox/eLX1yaPgvlWkqBirQ5I4sNjGHbMYp6Jy7lQzu55F2408JdPrcsGfIHXuZcBK4fOhIJn6bpVk9gMj8CUk8TFXEn0Ar0tmfQ0lL2BBw+KeQWlN9waZcyKOx7UcxUH/tnq+/0psVLJJjJZwmWaLP4jEVtqQifICs13LoklyiC3BHYQynei7uZlzx8tx57OUKBXqVTjfMfChqKlzItuu/h5PAHs9+Y7/moB7TLnkZqr3ZDjy+I7EIn3/19HtqVQxjfP440d+ClQglfcOlFd+Ao=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59908d6-9a11-4da7-5f09-08dc84c1d2a7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:11:57.8330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhAFyuOSLJkDxL74iuHJnXUWHNeiJwFTpkkN32DG9y1ZGEnLgHbBnCdWvEhcZJdfCdRL8DSF8jc9gqO+LJS8iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040146
X-Proofpoint-ORIG-GUID: -_Qj1-TDd6PtytUa3e59jVg6li9EV_JO
X-Proofpoint-GUID: -_Qj1-TDd6PtytUa3e59jVg6li9EV_JO

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 80 +-------------------------------------
 1 file changed, 1 insertion(+), 79 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 83acb7a4..618219b8 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -498,7 +498,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
 	const dt_uprobe_t	*upp = uprp->prv_data;
-	const list_probe_t	*pop;
+//	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
 
 	dt_cg_tramp_prologue(pcb);
@@ -585,84 +585,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
 	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
 
-#if 1
-/*
- * Here is a big hack.  I hope I understand and explain it correctly.
- *
- * DTrace's underlying model is that each EPID represents a combination
- * of PRID and clause.  EPIDs are enumerated so that, for a given EPID,
- * the consumer can look up which PRID to use.  A clause sets its EPID
- * to some placeholder value.
- *
- * During dt_bpf_load_progs(), each probe's BPF program is loaded into
- * the kernel.  Each clause it calls is likewise loaded.  Each time a
- * clause is loaded for a probe, a new EPID is assigned.  Clause code
- * undergoes relocation, and the placeholder EPID value is replaced with
- * the newly assigned EPID value.
- *
- * What's tricky is that the BPF code and the consumer get their PRID
- * values from different places.  While producer might send a PRID value
- * to the consumer -- e.g., with "trace(id)" -- usually what happens is:
- *
- *   - BPF code has PRID set in the trampoline, to a value that
- *       is set during relocation
- *
- *   - the consumer sees the EPID for a record and looks up the
- *       associated PRID, that association made during relocation
- *
- *       Specifically, during dt_link_construct(), when a new
- *       clause is added, the PRID is associated with the new
- *       EPID through a dt_epid_add() call.
- *
- *       Further, if an underlying probe trampoline needs to call
- *       clauses for an overlying probe, then dt_link_construct()
- *       watches -- for idp->di_kind==DT_IDENT_SCALAR and
- *       idp->di_id default -- for any overlying probe specification,
- *       switching the prid to the new value.
- *
- * We are now changing our USDT support.  The PRID is longer set in the
- * trampoline to a value known at relocation.  Rather, the trampoline
- * now looks a PRID up at run time in a BPF map.  The side effect of
- * associating a PRID with an EPID during relocation is lost.  An EPID
- * could be associated with multiple PRIDs.
- *
- * A variety of solutions are possible.
- *
- * For example, the BPF map could be keyed on pid, clause, and uprobe.
- * The output value could be a PRID and EPID for the clause.  Clearly,
- * this would take more BPF map space and more lookups than the current
- * bitmap approach.
- *
- * Here, a different approach is chosen.  The PRID that the consumer
- * associates with an EPID does not need to be exact.  A "representative"
- * PRID suffices.  Usually, the consumer only cares about the function
- * and name components of the probe.  So, set the mst->prid in the trampoline
- * to any representative PRID.  Then, dt_link_construct() will continue
- * to have the same side effect, associating the PRID with the EPID.
- *
- * Another option is to write the PRID alongside the EPID in the output
- * buffer.
- *
- * Work in progress.
- */
-	/*
-	 * Store a representative PRID to mst->prid.  It will immediately
-	 * be overwritten by the correct PRID, but we store it anyhow for
-	 * the side effect it has of making a representative PRID known to
-	 * the consumer.
-	 */
-	pop = dt_list_next(&upp->probes);
-	if (pop != NULL) {
-		const dt_probe_t	*pprp = pop->probe;
-		dt_ident_t		*idp;
-
-		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, pprp);
-		assert(idp != NULL);
-
-		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, pprp->desc->id), idp);
-	}
-#endif
-
 	/* Read the PRID from the table lookup and store to mst->prid. */
 	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
 	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
-- 
2.18.4

