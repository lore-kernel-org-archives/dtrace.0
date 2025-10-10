Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6393FB31
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760068212; cv=fail; b=T5tVOBYiAgCMJ/mmfQN0JM2J8R4j42befn/8cWupX5+Kv2Y2XFVkOZ2C8BdnbKSQHUOr/tDBVPIsGFUz9OdczBaQiB8S/dzVBPhDHIr0GMit2uxde4UdUybFxw6pFB0xLEpCoK32fW8MjQYICPnKTlWUbdmW5dD2GxGhKoH3jfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760068212; c=relaxed/simple;
	bh=7tzwDcDhtkgLXHt4YRm5gNa9+QfYEh8+fyt9mHzI1dw=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PXsAlNhhRu4g/84V2PE1jvKU636B3UXI6AVi77jjwTdqyIPzPmke65q8c8QpZPlJU+sjPx2LtGoc0LCXBdSjIdBfek0dLPFIUGLaCuIVp0+ofvoD/Fy1AFdwA8C5u8734r+xKoLBnZcNiyxsV0IKL3Yqi6XASwFnxRkk8Lle5k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f0JIGdr/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MaZ5eefa; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f0JIGdr/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MaZ5eefa"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A1P3DN030857
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=yf8USkNj0MpfTO8iTIdxfgB1KfMeQXWyChuRVmKnnB8=; b=
	f0JIGdr/5IPtOXuKPa5j5VX87+SwpsEemRmblXGjddY/B2xIn0JSiV6t4+W+OHb+
	1LqpN0KAvQgTeNBjMYFLGQwAdjYW8x92HJHrgh4P3ZbeU9QJCejHTB/lsej67/fA
	rqR5GIMlRqQVTiCcqi09xN7+3yrEUU08ymvbS9juu48gN18ATCMyvc99gVn7VdsI
	fsl+2q8yP5oKESUDxfi3wvQTSck74xn3VYcFTwShS4zfFYHuQk8a9Uwyb9hdIuGf
	86oHbgfAiKt//lS7xTfKl2+fZQsi4PeHfgvYVNw+fH6mFS0g4x8CE2it6YkH0xVt
	ZA0sCUK96/USjjpCFva6Vw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv8ptvkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:50:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59A36xuP014392
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:50:09 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012065.outbound.protection.outlook.com [52.101.43.65])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49nv687mkr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:50:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAzhrqPYiYGXxpIesY1+BOZob86XV5T+KysbHJlmzr5+HmgGbGfQO2q8WD23YflwShGBOOVsd6D0/5/VYUEF+y4omp72VoGPajCZI+yanlxrluQytzAt6ayz0ks5AYcCy8UZ3G2mLrjOE1zt6txicx++i/SIRUpReLw3fOOJ4Vq1rwmfn3ZXKrlPDDVOCDC4/rHfi40FtXMh+FtVVD2UZIizMyQcCfLjN+gxdUkifEtN3BBXZ0/y/ayQHgm6tCkpaxd3LmWJ5lJX3X+Fj9bGj7puq0rLlMxeoZMh3ZwfvktGLMToMlhhDcsBmXF55jIdQMWA4yEoYHzaWyGDwF65UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yf8USkNj0MpfTO8iTIdxfgB1KfMeQXWyChuRVmKnnB8=;
 b=kVrt3NTLisJ5D5mOvY95R3j/1qGw5s9U5H2JD/uo9AOhq0vTNnFXrtOWlbRsFaK/v8OG0/7s2D6862x6NrGN11QzCbhrSleU3fHJ7h3FPWemBa3f6Dd9u9kQMpXG5s4YuCkq9OsVJZuxx/mNqSEn5iWQgyzJEa/0OvXbGas2UvMJWsMTqL2arbNrSdmWrV1NA4ouAFxPNulWj0NEeYDsJP7cw4IXzrVg1cZdIY4AtJ1ID/6LXHqWTY6c1qlE7dYB42kx3vf+TOKwdMZHhPv4voU5chqZpkcLb5a++PMkCrEnSC12ebhvDwcOWQIyp6Cd/wNcs67Ne1WNLovlXbOQkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yf8USkNj0MpfTO8iTIdxfgB1KfMeQXWyChuRVmKnnB8=;
 b=MaZ5eefaNDEN6IHJlx4217WRb3d3hAhJSYNp0j4j1+QBrlHScf9dgbY+86wtFcdZRthtgBtnvWQESYH51libDrRGyq/VK9qQTyxnQNWZYtc5vb2g+XuvtpI9QgewjV5izrmX+b5hTh3HRwdN/vzHUHR+76ihSsrs/QSDdu9x8zw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB7034.namprd10.prod.outlook.com (2603:10b6:510:278::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 03:50:05 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 03:50:05 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] test: Account again for variations in error messages
Date: Thu,  9 Oct 2025 23:50:03 -0400
Message-Id: <20251010035003.4865-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6717be-22c5-4512-8bab-08de07b01939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lwifj0G7lUIKD2zPAr0/Tk6VybVn+6LFttDNO+J8bDA5TNtiQKhBe11iXtD4?=
 =?us-ascii?Q?KwzMxG4J4rbD1WcSrDFVeqDr+RS/hhPF7iLYMIztHuVBkjfsZFSUW4UlfJEw?=
 =?us-ascii?Q?Ef/hsaWyLPaKplLRnNOCBR+i9dPHinAco3SFOnQFkQpw5GKfSMNAKIDpSEBm?=
 =?us-ascii?Q?czZMMZZb+910QHzLj0oga/rMawg0jQWOQ18upetwcZg0MwYRa2oa3Hj6tIi+?=
 =?us-ascii?Q?TJJ6L5lxPsVihdGBmXTtf6sI+6WJIoP4Q8a2gSIB2BXj4nOXxtPG7Ogqv+Mg?=
 =?us-ascii?Q?0U/EbZ48TEt0mSUTy8RJCdOsXB3nAl/ASw+gD3Yt1AKhCZBUuwywLYMH88YV?=
 =?us-ascii?Q?0oYS0Kq6yrrLiuB6+m+Ey91Lz9oZUDEd1deVdiUoOe9MZvXTP6tzr1gyARjm?=
 =?us-ascii?Q?zUk/mvNMFZ/tbHmScu/GpK16fkD9SCwNTgrp65B2MhbKQFDzHKv+w0OoIGJM?=
 =?us-ascii?Q?jz8DzXb908fcVNtqZ0TsLvDukddfXULUgHYkwx/vkhcyEvr86wpLkqjZfTra?=
 =?us-ascii?Q?F1ZX6KlzRZNQYXEmMY/0fYhWT+Uhn0/xbAaBYQYhFZOB7UClE4UxKDCz5Jny?=
 =?us-ascii?Q?R0J/hJ5o/n9Vy2NAUU+mqykmM3Sd0L8rr7E25Zzak+GL4mhVeoM+gjjqCZvm?=
 =?us-ascii?Q?Z0tEaXyThiM+TISoR7u1r4nhc8TKiEhIxEbMqPUAYB6mn21nJBM8hdYMzXfy?=
 =?us-ascii?Q?3J1/Ez9Ot4p51y8URCmMJWG0fQ7sTU9gHGef4gpNxTSPSB6PqU6UwzSzwNBY?=
 =?us-ascii?Q?t2rVA/3sVRv9gQlosKXFBcPNLcNY9frfFms0QoPjUu3TZrLk/cJwlzcf7PZ8?=
 =?us-ascii?Q?tgBPM1p6IkvuH0qozjA+wqbTT0t6zoe4LQSjoSKepPTP1gpWeePEyg6PjlLw?=
 =?us-ascii?Q?zawBMF2LDjSg7NlYeSSohKHFagSAmdGBC3ETBvgg+LoaGYAs+zcfs2rIJC3e?=
 =?us-ascii?Q?7N/T1yZqkAhZ7+kWK6bHfcl+IENHuGDOHpWYundI/3NJLxyVfBrXg7GHqYVL?=
 =?us-ascii?Q?p0nXMBzIACfbdkDWnqSvI9jj8EZZy1cGsv5G7+5UHnUzJekjPasiwl+AVnwM?=
 =?us-ascii?Q?qVBtH4DeJjyOxTYAyBjcID4j/JamoIYiFlXXzb0GgsizXBV0xZANteL3MpEM?=
 =?us-ascii?Q?LEU8WhbSSVcpO0Nln/g73fY1fTocyOBiM2WYsUc96FDik6ddofw91KeYG1GR?=
 =?us-ascii?Q?AT3Z4p890kkWFbwHb22yz8TM/VDswkt44mRHy+2taGbi6QBEi3QSouvP7pH5?=
 =?us-ascii?Q?flR07Xy31o0qXJiD91qJitAfKab6DbbgbaL42vaRgtYDApzjqvqqwd6qjB4Q?=
 =?us-ascii?Q?jDICD9FWOFWhHwH92wrqdFSGtN/foTkInS6ZijWaJzBT74AN2/G/wxbKD3Rm?=
 =?us-ascii?Q?StLP5Jt/x/DXc1ShAfbdM1kqbI9nV8O+mUfAjgiFq21pkQia0H74EF9VnHdU?=
 =?us-ascii?Q?ty4bsbPdhSotSEISdPv1uZ+Hj7IvzYL4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N0KaKOThb6fiyX5fmXvJwwE1HEiI0BuyyYmVKamR1irwp/Khm+36wQi9B60W?=
 =?us-ascii?Q?VvZtj3OjSGo0kNd6Dx3XSIcUNZGGPKPfZiN/QdsyJmKo3Wz7kjRxVR0seG/h?=
 =?us-ascii?Q?rAMhUZmzccCe+hs9BfG5W8B0LQdwOOpjcCZRmIFyFkt57bnvqvUC55Nihq9V?=
 =?us-ascii?Q?y8WudfLae9c6vaj2nRqh70dx8DwGaipUV0HeHiy8eVzxFI3rgHbyg2HbwTpK?=
 =?us-ascii?Q?4DhIoVD+mL10PRrw6xSzaQjpx6phBdKTal7XkJfuqS8yPG4inb8KD3cZYUt5?=
 =?us-ascii?Q?/6P7xwWGB3YbpMfRMVNLslZj6eHPxJGezfhzS4bcZ4D633+Kdok34RB91Dfn?=
 =?us-ascii?Q?zfc883BL7uwrj4yNGPBjwgn4tbtVZBxx3Iw4dk37ATb+F6/DIvutlS4Dpi1o?=
 =?us-ascii?Q?sPrRuTbgv+QTpxTlues0z3LCz86b6GJEvP/TCte8hkRaSUz/5dxoL0zdxbhq?=
 =?us-ascii?Q?G7zwMlpjTJuxazrpkErTg+6TSrcbcw3Vyg9Gwb/ISC3aMigfJoTEyDgMPGM4?=
 =?us-ascii?Q?a9adq8xSa++kdgovrP890iV+PADnPn6UPPbxJ+ewO96Ta/0YbFXaN54mYFM4?=
 =?us-ascii?Q?153F7bOLTiikHu3WOZC72DnwLUUe2HemHt054conUzr/541DxeAUJhQzl+PQ?=
 =?us-ascii?Q?TwoSJb0fP/8p4UsgrMnHrshd8uZllQUP8IOgGhowalQWxEXAhVlpOn7Kcz6+?=
 =?us-ascii?Q?EGjXfjh93Cw7lbh/JEoRBhhAxlsSKoBqhZ5AuR6gugpr+/C7E7UpBHuHfuQo?=
 =?us-ascii?Q?/eixMyi+8PtFJNloq3vXivnrSLI5yY+Mi72O71e2h/b6YZsi2cJ4VhXnXkdJ?=
 =?us-ascii?Q?99qMzxzJRlSn2yBDp7EkUQWfQRSpbIMVQMuNDRqDwX0aP26wyYnKAfGOmRCA?=
 =?us-ascii?Q?iOlKOQUVxm5h0q7jRNPovX/Cc+r2Gn31vmByRqnPCycWkbU2YGtYMkDz2RMN?=
 =?us-ascii?Q?A4TxKQ0LnFCtbj4b06OlKJVfqDEiFiF9LC6oY18MUcnxGYqC6PxyRXrZBh+O?=
 =?us-ascii?Q?cBbXR+ykbL4vNCn2ktnzzMXRbbH9x1dQvCW01HQXLi8cEVoHWM127elDuAXx?=
 =?us-ascii?Q?WuK0izVyUfKe23FikPlSC1/R2PCrsmVL3zGOlqeqljL9IYqQvkySMGtb4X3k?=
 =?us-ascii?Q?EH4Dilm4d69kwtEx+2nDjQkKopSiL3IfCK38zEzw4IaCrhFqJ0wpPlMc9TY2?=
 =?us-ascii?Q?VpXqY1uRuzb9mORIUFEVj4gmLEzvaHADcKhSDTxXK4HzajUw8mdtFrk/MGOm?=
 =?us-ascii?Q?b4HOCa6DUrnXU7hTnYZGpXXyCllQ1GsGWV7CjO3RpMQ/sIKUSGROZQKQjuGY?=
 =?us-ascii?Q?70JfvR06ajsJ+DlnKUaXoAeGV6Bed6xx/6HDCE4XJM8EHxTZcxRecCppdxJ+?=
 =?us-ascii?Q?3+proMbbFtlt4O/E16AXmoBVVwRxU1LIP1s3zBY5j8PVESMOb8odbYiAF6Vc?=
 =?us-ascii?Q?nIG+gyVPsspvyC6y+n735H5OJ2HwidSBWtVYkcxQQ0f0gLBf35ZK/WWKDjYK?=
 =?us-ascii?Q?CFhidM+fBNWCjQR2Ac5gfKlL+ZUDCR7tBBZUBfSbI+j+uWjt48ypuLFXXDio?=
 =?us-ascii?Q?VO+LBdZvPpKVMFPFnXPmzREIYlQKJLP1XWkOKReN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DviQU63S/3iZiMiOA5LwDE4j7fZLqQLZwsj306qg2qTiqxqybgMIlj5po8DiWGKnXqBuJzw55ZUioWTip6Zd6JefShgmpsuR2FAJsxzZEcSnNDtXNowb2DuWolNi7Mub1nZ55ars6mt1F08dT256nB2ZYR1e6lYYC2oubzdjEoIjYT2rN3Oj5vrYZX1sopNW7CTs7p4O1gdBAs8tXYoMoIQhopgMFRFp/c4JQ6Em/8VuQnBF3Z4aSjsmlxw/gPNDnEwFlvn9GRBnvd7urBGV9+8EkjXaakARKq+gJtz5U3xUU+hi/aY5gmtGbi6cV1tnMjzEjM3LDgjFwX+Rz85U8sR9tzNZbhxR7ZnpQX/0DpzIqLHwCEDG5l5zE1O1vsPbSs/e1BndJmJHxUIMfhO60flbUZh68GdhyO0ki0ScufHq6u3ZrJwnNHvwrLiquPgtFbf9klpGkjyyN9dWVbkwZqAtEV8XZd5Bbcq+nqv6xYbWdv9tPd6bdWgVePCSiWlRy7qmmBOkjctcD4LDbM1NpnTaE6ygwwnezUzaWQYTXidZG6XoVXy/AQUZ+aeGYAXLPKysazcV1go/ZePEX5i5VAij8pKmVokv0xPaFYX4PQ4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6717be-22c5-4512-8bab-08de07b01939
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 03:50:05.3924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSeZRhxDx87pMd+HznilvOYwAuUcqmY8LdzALqWV9eDpOOQ6HGKR0mIDlLxSzNf3qgBoOEs7c0w5J0GHGEjFSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7034
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510100020
X-Proofpoint-GUID: bkp05llCIwUaMXY3rfXJnhNQQnDndP1t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfXxMoODXZGec5M
 nu4uzqb7ee+iduosjsN2uOXZULgf7JBsxFetZGIYNLWRIxTecD6MqVP1pwHhyBLBl4TQDRa/Ei2
 zuy9gqzbRC/mwDgU3TT1pEmoioSXmfE4E5OTiM/3bhPXbeQwlfupkD6NOS0rOx7ibaHNkvU3KH/
 7oFU8lG7UaKOuSNuVaHgKxOtJLJ5t5MPqb5Rc+XM9qBKB1U3BBH+LnPvJbgkkRpXcDAl1agn/Vc
 C4nwpUDMcMv9/0ikZfwCWAmcGVAH7/rAPqEMjaAfCQFIoiPSsNfddZBDewRDB8OvrgcyZLsdoNL
 TLtiCHYOqwvIaFdPN6qb3HtlqA8EliEY1cc5gfkiaabSXGqsic1arNq0HiHzjYf9WIr9jmG2dSS
 atg5StoczLvGfYX9p/23IEyOaSeIJA==
X-Proofpoint-ORIG-GUID: bkp05llCIwUaMXY3rfXJnhNQQnDndP1t
X-Authority-Analysis: v=2.4 cv=U6SfzOru c=1 sm=1 tr=0 ts=68e88271 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=sWKEhP36mHoA:10 a=yPCof4ZbAAAA:8 a=oHz7OCB7nJ9fqha7XMwA:9

From: Eugene Loh <eugene.loh@oracle.com>

In commit 944dac095 ("test: Account for variations in error messages"),
an attempt was made to account for variations in error messages.

However, it was applied to the branch after commit 49e646183
("test: dupstruct: fix extra duplicate identifier case"), and conflict
resolution was not consistent.  The earlier patch "standardized"
messages by applying an optional "enumerator" where that label was
missing;  the subsequent patch did the opposite.  Subsequently, some
logic got messed up.

Fix up the logic.  In particular, standardize on the newer error
message (with the "enumerator" label).

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/utils/libctf.r.p | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/utils/libctf.r.p b/test/utils/libctf.r.p
index 8a6fd8b13..504d4b59e 100755
--- a/test/utils/libctf.r.p
+++ b/test/utils/libctf.r.p
@@ -16,7 +16,7 @@
 /\[D_DECL_IDRED\] line [1-9][0-9]*: identifier redeclared: [a-zA-Z]*$/ {
 	sub(/\[D_DECL_IDRED\] line [1-9][0-9]*: .*$/, "expected error");
 }
-/\[D_UNKNOWN\] line [1-9][0-9]*: failed to define enumerator '[a-zA-Z]*': Duplicate member or variable name$/ {
+/\[D_UNKNOWN\] line [1-9][0-9]*: failed to define enumerator '[a-zA-Z]*': Duplicate member, enumerator, or variable name$/ {
 	sub(/\[D_UNKNOWN\] line [1-9][0-9]*: .*$/, "expected error");
 }
 
-- 
2.47.3

