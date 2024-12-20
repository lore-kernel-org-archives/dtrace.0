Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9854C1BC085
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 23:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734737164; cv=fail; b=oSYpX/gmUGjle/3oh+noJdgFwEJN2IT3jCY7JKxyIkTOnJocKneOjkYkiug9BcErBVclj46glFltmUVdC+VXBNewgYbnEM2OPOplWfppi9TkMJN5W8bZXwCgRphhvO2vQQhJildBEq7QxXc/Ajer1vXtCKwAEDzNU2l6G0oEwpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734737164; c=relaxed/simple;
	bh=JwKyitFJUjvPVZr4L+ATOupaoqK3eXxLVx9mi1vOZOg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BjOVQynxjPep3CUdS7xxuhGDubQsXZqSQtlcvk+2QlsbCTU2Gaut/3Cl5s46/YwHAurjLfy6yJRyfh1FRBUZD3hhXcfaHGT6fPinmcad7vgLkFVRCVs6Zwg5MdLAQM577T+DHx8O8WK01hbfJfmKjYe3GvFJ+pBPflWxntpo1sU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fyXs2LZI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mhNjpkYb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fyXs2LZI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mhNjpkYb"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKMNEDV029145
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 23:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ebKvrb+UxoHTRHEtTB
	pIKniEHPj0Mlq6KxxEeo1+7iY=; b=fyXs2LZIUhYQyAgrYh0PffHypcp6blV6b4
	a4sh71EwAHZFKa7z6atE5vSn6AEg/hO9jfdkjZuQGAc5BdfHoNYCNbGq0ZPXgFeO
	ejPDWmgQEghBDAqG3ka97K+e4weLKdBv8moB7oBxiTk0ZXSyWJlPrd8mZrvQ6y7E
	qyf3yR72joPQBRTk7wfgTtV/g5rhThdHvt2R4JzN2kANFdwRyWUhIuKlVsw8cSp9
	P2mTyPF8la6xeqMbb3UTdxQ5tQglxul1h3yv5SJup8RoOWBbMV5wx0ErZwmElKLf
	iJqlqYUUP7IfG4Gm10j2eICJUa7SQdBDm0ZcNHXDdfkV+nPP184g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h0xb6amg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 23:25:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKLEBbS000562
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 23:25:59 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fd3mdw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 23:25:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPnPf5RYX8Fza6AsKf54GNciNrzsuN6okiAUBkfrNCn/KhQVUKWknPdYUEso+oFWq54/aiV577GZqY0ds/+dqZOh0NZ7BNTLtDTe/mNgaf/Kz2z0U4kA23rt6oEqDrjZGZOz1nDiuJlThX54b7dc5j8jtLUH1hEmRx7GsJIi8QoGIXsmz5Y3N3ciDLP7nICXY0Fd9ngysz3L0SjLHkYhkbBZulVYfU8TU+ArdiZ83jX/cAT5RQURQUrbUdOe2smzEVTukQ9x27wIpx4kFY2OuP6JePfDZQqa/iF7zIOSgYoufhv9sZow856p+v+LQVfTardxLNX/ge7qUm1eIP+5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebKvrb+UxoHTRHEtTBpIKniEHPj0Mlq6KxxEeo1+7iY=;
 b=uFDyJpJpW4dMcP5PwsVIiE3xJRqvcXRO9arwClR/OsB46ohPGJnOWnwrlvaVs8kNN8iSJLgTTAnZCJ298f/9BYEwkgx1doB/1GYxsphi+9sizA99fja6OcekZrtApMjdms78kuiBK5e4F9acrSb55UbpYxemd9WWRM6O964e0eBhioii5RaNpv0RJwC8JWu7O/aK5IvSw39br9K0ZkilnPLHR1NaZeBhv/JYPIIDF+L0W6zuHDg/F0K0OK0/otRDo6xF7pkrPBsB3df+CjOb8mAiyrckU/iRIZNpP6hOE+YMBKVlpRac3bRzHz4odFy2xi6fhRKl2yZpOFxnPNUhKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebKvrb+UxoHTRHEtTBpIKniEHPj0Mlq6KxxEeo1+7iY=;
 b=mhNjpkYbnB6j8vPt+ULDF5Pw13fj9orYboinpcM7o91O75et0JatQNw4O/h6pUJKrfnGGhOxkhXqLkEvuvhtlVf2rw1Iyda8G4iVDwAoeHnSncyfgT3GTwBqfIJzDwGIjZU7wlttsUcx9q/oitLJr1ACcCTr2mnLUPyFerpbELU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6179.namprd10.prod.outlook.com (2603:10b6:510:1f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 23:25:56 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 23:25:56 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 5/6] test: Move disassembly and extracting PCs earlier
Date: Fri, 20 Dec 2024 18:25:47 -0500
Message-Id: <20241220232547.19043-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241220232547.19043-1-eugene.loh@oracle.com>
References: <20241220232547.19043-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0470.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: 51fe0af1-0938-4baf-1e9d-08dd214da73e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lwtQv53fikwxwb7nWs6bMkTN+0t+ppevVV8/F3ssBJrCH9DGYHhJYyhzDE54?=
 =?us-ascii?Q?SAtoV6+azOCXlinFs+VHJdBRJWk/V8+LK3vd5MEpYBTAEpbMRW2VJu4pdKni?=
 =?us-ascii?Q?3FrUPCj55UIvMALyazes3fD4s8dhx0dOEUcdGPthhG9LrYmDIHzhfJCiMQxi?=
 =?us-ascii?Q?eomjiuhhNdwwDVTAob7fMRmW+45PIxbC4dvbu0fxTwDj/8X2STzHZSNmiGQi?=
 =?us-ascii?Q?eqbOtCeuuJuXqfeFnoBmaGLv3/n6J5+s7R7LjOv+zSkq99ePBZX1o9niR0TA?=
 =?us-ascii?Q?xpRHIMc6T59WsMb2IL0TRD0KJV9yzPWxgFFm7LIjJ+6tDH91hs5zUVUkS7nL?=
 =?us-ascii?Q?IBJ36MbfSSnKEO/WjOd3SVlIik3Nbz/CrzbcjIDuL+fmxZiQ6YD19J2M9LVM?=
 =?us-ascii?Q?iYFocyJP5pnn3CvHQIE9Ti9DIZ5lLUcyFuX2aXM8Hoy8FymkL+5h8N8/Wujo?=
 =?us-ascii?Q?4sFmDNzMp7efzyfCKS41VatJZaF+szy16QipvuzNEfidYElpuNbl5Bg7EI2U?=
 =?us-ascii?Q?58KOoarNGZYlhbG8T6SzsgfC5sWSA8LiB/AoGx+xzqpVVxT9i1+kfnE+gGqP?=
 =?us-ascii?Q?xT7mkNWdPhl0ozTGmu8xgZUjTWfTeiRqLC4kvw5AeyArK00qXnnEN++v16b9?=
 =?us-ascii?Q?ml+/SxqNk669esUBH+h4zytPN524g4egb1rwEg17Kjyv1XnCYyRvrn0wfegq?=
 =?us-ascii?Q?qbnAqcfNnDAnwDAnnB2SW9Ssb0lbjHV32hGT3DVbeVr1J5LEK04Kne/HhMu+?=
 =?us-ascii?Q?g+NPCdj8buoziMUA7oz8vdfTQM3fkDIqzC/5P5v3NuM8NrrQCusEXIrzU8xu?=
 =?us-ascii?Q?QJxPtcG30kUm0B/CFfRzwzDN5Ym11V+Wtwe6BZlSk0feyi/rY5A+jAQM/5ua?=
 =?us-ascii?Q?tvN0XrEg0VoVKh7t4UP/OD1xtL9C3CsKC3TdNDwMdOyGBSNe+CxVrHzbzsZO?=
 =?us-ascii?Q?f30JeipClBODeG0Z73X2eN3qy36tZzcYG8j1jeB8PVdE0TPbPI/V4ga22sJL?=
 =?us-ascii?Q?A9jJVJ9FfqdkCCRf6HfXfEhyFD6MMjNNj5+FahF/0MJRB0Vl9i42uDf9uamm?=
 =?us-ascii?Q?VWM9qDrRSpgOegFwGflYStCAaCCYD2HIdZZSqOJQyBP4UsrmR4h6QUg3nrs1?=
 =?us-ascii?Q?o6kZx6v/SXKXJ6Z+aIAz+qZNDlpL5FkMs+0YJeHKcjWAFB7GG1hfV43dQwf4?=
 =?us-ascii?Q?lXZcKu4gSoVI5xH706d2OdcuIDFpRBgfjFQZ1ULM72tj3w8CTg8JBF+G+I/l?=
 =?us-ascii?Q?PnmFzWKQCtu58nvFncKlUpBQu/l3WlBHgdkc2yBbtZfKCeBKIXQC33P7Ige1?=
 =?us-ascii?Q?YdHcf/LX5ubZXU74+t7YOxNEcqZLVkOaFwg8pTEq/T4wXitU208MpkMCb0IE?=
 =?us-ascii?Q?ZpwxhM0wnyl0jtf3IXfokmApfLF0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?68AyqMn/UkTutk/mvXggOQaYiBKHGr/izSY90+eRFrUYYpFWM+5bW+2o0eHa?=
 =?us-ascii?Q?906VFLjQPLd5gjK/oX1hI7USKoIpECA8O8m2f9G52yYuBGyuodsg1acWb4b4?=
 =?us-ascii?Q?8UJVvPBYUxxkpyUan+YpYnWZZPrDIP6Y8HKgCPOJ9NiFGaqLAdISx8hEJmPJ?=
 =?us-ascii?Q?XAsU9vW4AvGIsYA17oN7nJEitx1E2LUpIIdj/C7KPC6W4fb71m5ibpS27qph?=
 =?us-ascii?Q?XHngs9FDFr06DR/343uZktlLHy0xvva4RYhjdVeY2EXVCzol3iofHVMpmgk8?=
 =?us-ascii?Q?ojIxnk6LMGsPsfmeXz50rHFGTNBBfeeBy/ahfa/6YIg4hI4YfSRA3Xy0LuKA?=
 =?us-ascii?Q?tIth20aXNBWe8kwckAa2KyAob4uKTnfJmCmnq/9i/XQ0UjLI+V9gMHQ5Eb5a?=
 =?us-ascii?Q?nKCWOpvs7RZ/+LrMpt586qLKov87hKOr0Tiz6olv/jPvF+ax4SE0n8UZjW0X?=
 =?us-ascii?Q?l8R1FKXmNCalV4N5p841Qg+QCdm4h+yY/o+zfucKagD08ZTcA2lDpjgBzFbk?=
 =?us-ascii?Q?Udy4hhCqNdjNcq0GQh7znEdji9kjl/hjp7hV4jb0ZY7ztwOMipdY+Im3BUfR?=
 =?us-ascii?Q?FwvKr7RXNRMNIn43l0ifObpmGgIKcOwUrnchRRBG1mj8/wXv4+b2RMmGVBIw?=
 =?us-ascii?Q?iUBggh1xAnnsGkO/Eo0qNtnyaXAltYKLT/tv0+dsa7hzC5Cn2MPol8fvN/HX?=
 =?us-ascii?Q?95pyfhRSzJXHnVKWPRgGy3UqnY25c4hfVG6zHEU55xz/WsycKX7WMEHI+Ec8?=
 =?us-ascii?Q?zZVihHjIvt+jNYcyRRfagaQp9cGfBAsiwihKZpQAWN1pBAmbSzzwKgJns868?=
 =?us-ascii?Q?BVtMs3/3hc3xMdY4JyvUQtmJTPoqOKjzfSYTVPGdaeQjeiIABGwt1L9eMygm?=
 =?us-ascii?Q?hWafqkB2DY3PMof3603ugT4dxES2DVv82VNhLUVYO2uiY1n5uAok1KQW9IHu?=
 =?us-ascii?Q?Um6qdY25cWUx+xogP3IcWWdDBGHGn4Xiazk0hZe/CHsrpKaGen4DdBteGvQE?=
 =?us-ascii?Q?7T1dpuCuAuUiIUQRhgBrKx8ie4ZxAR/QwLbAoAnwHL/Qyco/MJnP7v4Bgqh+?=
 =?us-ascii?Q?CJJqkCSrqnOkFMhcCwkqpPEY50phusEHx9braen8LA5nfB7aURXzsYgSA2Wx?=
 =?us-ascii?Q?a2ddPDmAZw/0efnVpGXH0beh3nmXHbE6yJtDX0fxUvg+FXkkL/lXi1V5VL58?=
 =?us-ascii?Q?e2rNbYdbAagB8rlC8Si9QuxuKs0rWUJQFmJh2ftslDKryWIdYe1Ex6ouamoN?=
 =?us-ascii?Q?zAMw9MxiXK2F9YEpurFQpY+apvHVacPJUtiy7rQYxhmpW7W3+2xdEchFzs5X?=
 =?us-ascii?Q?xDbHnW0Z2L86OE3tC659Yg/UnPiHejnvmhgUQalQay0xBJxkKCaOIY0Ozxn2?=
 =?us-ascii?Q?izKwi7bq0dpBl+idDHxUa/TfKagWmEXtkMhk4wBtkxyPyjFRUMg5Hx084lK0?=
 =?us-ascii?Q?7yCpIo02hmF5hQcyrAmvKkoIbs6GQePOAB7tpf+vkqk873t/O+nc6gdIpSO0?=
 =?us-ascii?Q?huX8kl/eE0Z2d7IQHIDH0qpIojZ+uAIFm0AYzVcaE81QnGTEOuRX156XPXr4?=
 =?us-ascii?Q?ygGSZivzSEeeGyqAC0B/0nVPkQUsIxXVkPZLwWZ8?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RemjtsZ1vc1iAMrsO+LSYmQdA464GxvcGHQB47VsPFOVvsBgCPblV0Ea8GWhMcNaV+tCPKdFZOOL60gncBQPpjtXm6370hvc2pCrS+tZ0e0GK9yUakTjzIoadv/KmrN7ymUDNadAL7uF11ZqB3j2nc+L0oi6lUd6uPAcnY+4O46P8BSDuVENJBwAFMo+zyHPDklFzcY5q5UuwvUN7VwVyQCXT9rKrNogbeYnr9u3f5Z2Y733y3mM9GowUyBT0bDL6BLB7A7jAU76P77ZVb3q9a+U7qTlqnDTuQ3KdPLDhN2BMO5jcncfhCNYcKC8EO6Jvl6IJl8o3T/Ys6DKmXTDZsvPu62g5Q5x5aZH/IHTpBU+KzcG/dbE5aTokiBSkYoN+TfkhUu+TDay/8nYnTS/9KoqiYccLM39UELrdv9BovHOaNPNJOPbPX4a1+nl0yQwj+cABT4msmBg2EhVoCogbS8OBEZjWUfDEGp0FBbtseYNRg+NZy4UoEGS4eQZDAvBhIxZgc2HRtmwKk+ihXxZFlDqj4/2MK+uOvLOlnJz060xtFRa1wZigKlh7eiN2BP/P7LlDJDSe4yaGgJ0AgfiB4SunV2JYpZI85g4/e0t6mQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fe0af1-0938-4baf-1e9d-08dd214da73e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 23:25:56.0773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQeWMFexpzlWkNev+14SqtupF+LD8HkWP2KR/AHW0rRodyrRELVkcqkxKFYRbGOkLn2zfDjXg9EDQ3m+qJBjww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6179
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_08,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412200190
X-Proofpoint-GUID: 34XflAZVUiksphbW54Y3N1r8y9a2gJjI
X-Proofpoint-ORIG-GUID: 34XflAZVUiksphbW54Y3N1r8y9a2gJjI

From: Eugene Loh <eugene.loh@oracle.com>

This will allow a future patch to use the PCs earlier in the test.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.pidprobes.sh | 33 +++++++++++++++++------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
index 6fe6d752a..54444d49b 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -102,6 +102,25 @@ if ! diff -q main.out main.out.expected > /dev/null; then
 	exit 1
 fi
 
+# Disassemble foo().  (simplify with --disassemble=foo)
+
+objdump -d main | awk '
+BEGIN { use = 0 }             # start by not printing lines
+use == 1 && NF == 0 { exit }  # if printing lines but hit a blank, then exit
+use == 1 { print }            # print lines
+/<foo>:/ { use = 1 }          # turn on printing when we hit "<foo>:" (without printing this line itself)
+' > disasm_foo.txt
+if [ $? -ne 0 ]; then
+	echo cannot objdump main
+	objdump -d main
+	exit 1
+fi
+
+# From the disassembly, get the PCs for foo()'s instructions.
+
+pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
+pc0=`echo $pcs | awk '{print $1}'`
+
 # Run dtrace.
 
 cat >> pidprobes.d <<'EOF'
@@ -153,20 +172,6 @@ if [ `awk 'NF != 0 { print $1 }' dtrace.out | uniq | wc -l` -ne 1 ]; then
 fi
 pid=`awk 'NF != 0 { print $1 }' dtrace.out | uniq`
 
-# Disassemble foo().
-
-objdump -d main | awk '
-BEGIN { use = 0 }             # start by not printing lines
-use == 1 && NF == 0 { exit }  # if printing lines but hit a blank, then exit
-use == 1 { print }            # print lines
-/<foo>:/ { use = 1 }          # turn on printing when we hit "<foo>:" (without printing this line itself)
-' > disasm_foo.txt
-
-# From the disassembly, get the PCs for foo()'s instructions.
-
-pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
-pc0=`echo $pcs | awk '{print $1}'`
-
 # From the disassembly, get the PCs for USDT probes.
 # Check libdtrace/dt_link.c's arch-dependent dt_modtext() to see
 # what sequence of instructions signal a USDT probe.
-- 
2.43.5

