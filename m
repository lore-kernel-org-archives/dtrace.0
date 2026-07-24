Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3CB38F65B
	for <dtrace@lists.linux.dev>; Fri, 24 Jul 2026 20:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784923779; cv=fail; b=VDTFgakTnHASg952oNdrmeJ4U/Em12QQwq2J9vD2Y7do+xEEpcpZeELx4O4IZpqKi+Gw/AaTuqlAQL5tB8QoMD/5EORgnoyot997hkctreyUB/mC694m2+GaJkC9lTBmlWD/USpVF0BpG448lzSSKem552DqQzxUWXkrDk/k7GA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784923779; c=relaxed/simple;
	bh=AP0b4GbSE/YLgKaTAbG9liTqpYsNad8nrgNImNV2XwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tDE/WssUU5Nel5nrB6USynsVAwQ5ZU/m0jvYDnqIYfJC32hCz3yj0iQUG5ZfIrR+PN5d/FVGVUKuRASZAkOFfvk6Knk095JcYpM4x0nEGvGUEsgd3Bphgvo+OTeNr52lNaCfy9dfF1ExV9RNw9gexP8CBuZnZCT2CmA/GKIBcCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aJ2Wenyu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SRnT63dE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aJ2Wenyu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SRnT63dE"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OJciHi4051868;
	Fri, 24 Jul 2026 20:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=+E8VdDoJnpEMXZXD6b
	+dGSWnx7nPqoEaTYRYEccOGV0=; b=aJ2WenyurSj2n2xSckcd8TkqBooZi9x681
	dYKGkBLSOcZgOIgKdgK5aC4MhjUHiEjjdsbW2JB1iL0ekHXaf+e4kURBN2l0G4wV
	r+c/S1p6eDC2D0/Tk3TG/mx4x0+BArQQySbnVR8ZETIPAEhoT3rxVEpWTZD2r6Ny
	ofnipKuuRpxq998hY0uydUOhZKvf0GL9THsFZW2ZY5F6uLxaXme/QbcsOHpBUo0C
	GnwvTnkXcg341A8ahNDHYgzs9PynrlCjg3hhkY1w1c5rC4cUv6EC03r7f0eGPwdG
	OEojIYOCifbtwZm9PWMX9/DmpD0XJyFBVQZib7Hn77XZMyiy3daw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fg1mv92hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jul 2026 20:09:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 66OK8B35039796;
	Fri, 24 Jul 2026 20:09:21 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4fgts2nudy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jul 2026 20:09:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YA1N94XyM5J8OVeQqKqnQAXJEoE39pUlr+OjcRSHj/nsELxuAgS7RGB5h8oqvk6RnCI2UwqtnWNDuYfY6VII5lhrDfZPzfSwgAIC3IGAE/WkbrgpV8EYMaajDC8ew1dQZSBDQRLeQW6G/CmHkQNuDK0Yoxy/qVNVp8ogXKlM5+AwbIjK/E8RQO8lYgblOfQAfgEzVXo7C/iVFr1r7oC95wm7hTfx03i7r3OQGdfbtzJjHgG5Lte0cNCn1Qq5cgriL1wb8qIJtHNv6VqzEnIoGVHcfMu1+gvWU+wYa3j8AK3rQZ0aWPEldYPR716HEsd9P23s+xizXb7f1+nv8MDNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+E8VdDoJnpEMXZXD6b+dGSWnx7nPqoEaTYRYEccOGV0=;
 b=B3EqM6tOqeTpma2VoYUS9/qOnoUVW6namaeK6i7pt1gSnPmCFY7kQpoCKcvqF4stjf+pJ81XOiaWfzBDR7PJjjtas/Aj5z4yv+raZ0Z6jonRXvOEMTbfa8qUqzIbg8PM45+7WSJoCGUsbYsSFxpIjXkUSOlOSAlGIbrSCUkCfCXd1s8e6jJo4Hqg/yzzblD4klBAaKx1J5BUP8Q4JdV0zwon+RJk7quq3hHzGeZaZtMjJs9Aa6RjgnG9DCJ11wR2O5k9LYQr0T2U6hD0m34zHeZo28wyJkWN4zFMZu6T1amlwphiA6jQJF/ZV1QcvIKuRtI8UkoheHmGdhVoXL+y3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+E8VdDoJnpEMXZXD6b+dGSWnx7nPqoEaTYRYEccOGV0=;
 b=SRnT63dEDPUGxz4aJ+B30NhC5A2Dj6EXdMHgN0Aloq/DWowmZnpwPmJSEm1u7LmlWwRrnAn77zWJLeM0rOVsBaOV9+kjA0ufyITTl+tJtD6rERFOgp8INBGojrFwkA3NbXXR9YPsahVtTaZGBR3J5o6Fl+MsgHhT+PVxcQT5yBA=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by PH7PR10MB7732.namprd10.prod.outlook.com (2603:10b6:510:2fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 20:09:19 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 20:09:19 +0000
Date: Fri, 24 Jul 2026 16:09:16 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Jacob Carlborg <doob@me.com>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH 1/3] libdtrace: resolve BTF type tags when importing BTF
 into CTF
Message-ID: <amPGbDumUAKSXjuD@oracle.com>
References: <20260720133100.77573-1-doob@me.com>
 <20260720133100.77573-2-doob@me.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720133100.77573-2-doob@me.com>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|PH7PR10MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 44636931-d611-47f5-bf2c-08dee9bf71aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|4143699003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	E5MM+k5N3SMYGs1KW+vaIRgTSzmJPcN2ugyAGE645MStr04C8YJheVD7BUGH9jfIwnxyFkxV3txoSAvaowv2Xnh0lea0A6zbru1lZ5E+uVou7d688uqVVMlkwauDsYX53bVou1bT9Sq3U+wYuU8F87moPC7LUkWdfffiWqtLayky/5xKGCq3i4Qq7yfMSWlDHP2MzHDiXbKSY9vA/ymWsX/s+J8yK8VDARecIuA/ZTSv3UjEEtETsLwCIYn/mE2/B6m8Dni71b4EWHZ/TgtuBm5+TlvilmzAxket7Fu+A3pN58s68CTkhSku4QmSdDSk9qgXA5apm61Rmnl8l+F+fD3w+3LlP1OTJLnpCUjbTICTWtfofDjajJXqrb2ffck5qPEiNNTaEk8f/DtRGiBaJS/OZpjjcaVRAghtb3uFZz04G6SRlcChWY30FzEviAhk/SDuXM6h+Ns0xig55MjVLl5l4u0p10O8LdZtefmH00k1gteBGC+tbr3E2vL2rVd233CUmtogNUxu0Hc15f9xO3V0LqYPdputfK1Xo93L67b0eHsQijt9b/V4OQn/g2uwr20kKTlRYQaJ+xPc0PTcyGayqzWnXWoQlmKc/BSsVUlPkzNOo/8quZZCXREiXz0KZ+aSCtrRubdJgvp+nQSiZE6Dn61ZG5KxAnGgpvYg9Ns=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W+6ONtm4XXhuq+AjhDhpcM5cQQSspFwWkFCZw4yk86jG9XLAg4lSfwcRyCpu?=
 =?us-ascii?Q?t3+ZsKz+4Hb+qeCKw+7PjEFFU0aO95OsOlzkPET5PBeoLa/CeRnYu8WScma/?=
 =?us-ascii?Q?MJt8C/qtOuP6MxX4k2D6rKJAc2yetahN88a9e8xpI2DbwiYrLbL4St345/4/?=
 =?us-ascii?Q?QaeojLh8e9Ny0tWrnUQd06L3p6/uiyADdtsWqk1bfrOMylMI1etluaF1OZam?=
 =?us-ascii?Q?kene0QoGQbVKyLmbDcIkgzgKXZRnXuNly6/HSl/A4HgoEhmP9dE1ehbhXZ0u?=
 =?us-ascii?Q?xJbyFNhwadfhXdwgvjz9oCoMKMUbOVNr4/G8ajXgFg46sPYsL+sMu/8UZ8wQ?=
 =?us-ascii?Q?umYnUGd+Uqsy+JeeNskDtg+9LqKG1n9ohpPQ+Y6C8uTUk/gOzNGMtM2J+Edh?=
 =?us-ascii?Q?IwLGTzh2MIgv1CjMrTHxA5dQNOw0ZGgr+TVBNwa3bdV7584kg+MZyv4KpmgU?=
 =?us-ascii?Q?KlsM9tTVSN/iAnypcCAWTkiRFihQ5tRcZ6L46OZA+3J6/kdG+IBLBPhTwbXg?=
 =?us-ascii?Q?xb25041TtpP4gg7ReRPNDfYN0CdmB/Va26MmSIXnIsm2Rvi9GxlY7oWa+gBK?=
 =?us-ascii?Q?VsYcUPuybyf2BVEtIrYW5ohfekEK2ibIvBfKMlWpTr0PITPd1ZXfJ8U0Pd0q?=
 =?us-ascii?Q?hLp2dijEXNU0AjIsijnF0p9QNQn7j8z8GkVuDaSuacQaWCVZCa0VU+eruC0b?=
 =?us-ascii?Q?PLiJKKjxkLHV0o2yd/mNhreWQo5GhEEmtbvMPuXCocFB348Hr9eDoSEZ22ot?=
 =?us-ascii?Q?RnVVZtGGA+RitsOnZLVeU/gRi40QTXySy38kCo3Dk1+M196Jgjezc2g/LJND?=
 =?us-ascii?Q?O4Ui2fIVm7x/1QLo7tEV/rKRJWpDHYjHUzipLZ1PxuybUUcBEj/LqdwgWpJ8?=
 =?us-ascii?Q?jiNYzXpDk9maW05Gb/td6QO+70evYgA2tADO5knSAdcsRvye05tYUn7EgqsK?=
 =?us-ascii?Q?gzkkP/TpA6xW9C9CpUArD70P3C6hY/SnHCKwc4jzBViGWp5lv71sc7pp+YWJ?=
 =?us-ascii?Q?CZmCpR8sp6GUWELv9ez8dOCVyy7wiReWPMVB9xpVvSlXPhWkdyexn4xga51u?=
 =?us-ascii?Q?tTOcKH+z9Xj94fljVVwqhwx/MO2i8mN70NP5tihbjXzAuex+GjDKn6xjf1jF?=
 =?us-ascii?Q?4CGEK+bqdmoJJzayZWHEHEEVTJvRcljFHPUTrEWr9SAjvBKDEhRo0ATarmGn?=
 =?us-ascii?Q?RXGq20TwaoVHQWo3vRrKvFR68fkKD7cYmRReh1sU18iq5o+kShn04nkUgIhV?=
 =?us-ascii?Q?gvvEJWBNxJcBXIPpv5aMtrj6eFLJQW3zo5CDHnSjCkGz+HjdiDOLLr49C0GG?=
 =?us-ascii?Q?AUb6vCzCOiDEk1p0h+TX+9nEZ/bdQK/ebl86t/CY+eOyiK06LtPjHKCXwvKV?=
 =?us-ascii?Q?DZUpHwJINdr1IIL/rUtreRtJvsyF7mJOp+KnkHJVY7T7MTkI8KAMOh7TuWA8?=
 =?us-ascii?Q?k+oyZ5ucCTQ1DehZGQNhcOBnzUXTUrDS/1CGjnlyoT+iuifgFvXUH6XenCsB?=
 =?us-ascii?Q?tG8n6LvZJBCyLFZxVDqsyFy8mKXPGYFcLLHcy/9LY1ZxjCMDsF+jXPp7UZ22?=
 =?us-ascii?Q?8Trp8Vb5v61pjwKFf08l30tHp3zCPo1SEM9oQAhEtLvBdkNCBHtTBiPRuly3?=
 =?us-ascii?Q?jhrCRJAxSYzVgiygeoZKVh7fJMy85svEq+ZntZ5WSmbjbYDRCQX6IGKridij?=
 =?us-ascii?Q?t8RZRca5Q5TWN2hYFaD2zg6aussjgq9Y7+H8cXx8ukwOJrk1DhFTUlZIc1do?=
 =?us-ascii?Q?97XIHyMQ0Q=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	Ay6Vd1Duou/mzDRfpNGKyx+1JJNC2nQiWwcWBZH0CT72+3Hc4QgOrEElR219KDPNLLnYz3Ec+yB+HWYlTBIiMJXqQGuH/y5lvFmfW9hFy/vPuL7wVHhxFpkLnsKWtC/zULprDrSx7hPn1q6JcZV6X4mzv8mzjCU5HtaR1RSK1TF4uO2bRPLnQk8pZsB/9rXuc1p44FcJBms4P8LHwz5Cnx0tWn/y25Wl7H6kNdvVifmOxn8231uYZ4Xq7JmpHKM6yRky0C3g/9+obgdkoJQMMwsIrf/+gPalavPswsPyNyl4ZCaWaDjQCghS2rwZBx50sdcuhiUtYTTkJY6e6ut4LQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	38BkeMf6tndDlzi0pQBJ47Ekn7FvoWccdDXGP55uAzbU5HLL1506awOiYAz2PUN7PoOVAn2j9AOjlNBk/lCEuTyfwEENhnqTCF6A+miQWJvvunxR3Yb7V1JZDoDP+Pm05iVy5arRNgt1MrKYfh3j1NFa/NVL8w0LL6MnRxM+5orD4H/Wd2CRoj5qeylOJORVgMkvcscRgpMumroab0Juiz7blJO9XdhFUsBpaKRhdBmx8fcdp8jCCel+Cu0irDtdKfEPOHi6/sm0ZCIbdo15plFbt1O7ixU/nshmnpn+c71COrCMjNtxXKkT+lsS0CA61w+/+jndD3FnRQJ4gUSNbTIwVpXx8RQ83L1lnKMbGUV8YUslwI0tf+bNiYuW1VqyV1tkf9qQv+8mTS88EwF1iR1aabdg8C9qYz+7792KyBtkoDJupCFzJaX4lDXrh9xaAEnkKgC0AzSGHjfKXUi9Xj69xfoOD+Xfm0mVaCjvn3isZDUslRu0mBHs5Ha6eBk4wXGjVwjoThqojR/NOUcZV9cmliEmnWnz+WxjRxO8EZNBC9x7RsEdWio2vFwlY00BGfSJmEJ3XDPe+m6Wrf7k7R2TrA3JC4ARb+VEjMHYlmk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44636931-d611-47f5-bf2c-08dee9bf71aa
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 20:09:18.9685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAN3nEWzuEQTkjTiKvbUCDCkHCUh7+3o4Xpwouwt6lWRcN0T3BrM6OFGibSoGOC/W9HK2gDc0LqvYUIlE2M+HtzkZvzJzAHP1Ayn6SoA+PM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2607240181
X-Proofpoint-GUID: cai2_csWKnFzy95JvfGvf6fr_tZiQ7md
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE4MSBTYWx0ZWRfXxQfIvFXERfYv
 FmDM468eJjDLrAiaK1peEEu6wftfR2qwQNxdQte0NYq4ShCACWohiiQfLDAHwxqPu7b/SF0ZbbL
 txrBLVNss2hmzFUQzJ5jeoZezOA+5c1T9t+Gq6HkiGDYJJnJJ5ll
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE4MSBTYWx0ZWRfXyh4A8eq9srit
 ACIUC+QvQ2NZlRgoXBa9wkyy8rAia4kusYZ7LyLPCYWbBbH4c9v1Q+EC8xHZ18DmtLFBKVQ27sE
 ciG1SxzA3KafhUVjkJmmzmi05Z/Lezt0DU2Dm3Sk+PtMjEqHsZZWTtQ5yZfDeE2sJP9Ou2ZCImL
 I6LhJ+EN7pbPBPiQqPf6nRsRSGYmGl5PBx33Kd3qN99sdT55J4/XOf2sH3jYoVXv5np/ZK8zRFc
 OItcXb2HO8h4HVaUgAT5QVObLDa7Bbp1cIEeT+NebYT97xFrBnFdKrNJqpM66XjNkqFJtFLmg9H
 2uQYexdec4mf3Q1Z9mIhMOMRQDHZmmYVeKXDMAoh4u2tM6QwqEXxaAgg543TIBU5pYZn6YyLeEB
 TEGKMrcCAdBHvf+udetL2jiHtyfgxrQFReCNew5DAXP2R9SOARTjCuqZ7Yh7vslgfThi61TzvRW
 D11JiX1Zs2xm0DfuRDQ==
X-Authority-Analysis: v=2.4 cv=ZpPd7d7G c=1 sm=1 tr=0 ts=6a63c673 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=HHGDD-5mAAAA:8
 a=H3CK2MyM--NBV2H3lOYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: cai2_csWKnFzy95JvfGvf6fr_tZiQ7md

On Mon, Jul 20, 2026 at 03:30:58PM +0200, Jacob Carlborg wrote:
> Without this fix, running any DTrace commands results in:
> 
> ```
> dtrace: invalid probe specifier ::::
> "/usr/lib64/dtrace/6.12.0/procfs.d", line 131: operator -> cannot be
> applied to pointer to type "void"; must be applied to a struct or
> union pointer
> ```
> 
> The issue occurs on kernels which have BTF with type tags. The fix is
> to treat `BTF_KIND_TYPE_TAG` as a transparent modifier, resolving
> straight to `type->type`.

Thanks for catching this.  There is another place that needs fixing as far
as I can see...  In dt_btf_real_type_by_id() we also need to handle
BTF_KIND_TYPE_TAG as a transparent modifier, I believe.

> 
> Signed-off-by: Jacob Carlborg <doob@me.com>
> ---
>  libdtrace/dt_btf.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> index 1f793397..1414dd1e 100644
> --- a/libdtrace/dt_btf.c
> +++ b/libdtrace/dt_btf.c
> @@ -672,10 +672,28 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
> 
>                 return ctfid == CTF_ERR ? dt_ctf_error(dtp, ctf) : ctfid;
>         }
> +       case BTF_KIND_TYPE_TAG: {
> +               /*
> +                * A type tag (e.g. __rcu, __user, __percpu) is a transparent
> +                * annotation on the type it wraps.  CTF has no equivalent, so
> +                * we resolve straight through to the underlying type, just as
> +                * we do for const/volatile/restrict.  Treating it as ignored
> +                * (mapping it to void) would leave every tagged member -- such
> +                * as task_struct.real_parent (__rcu) -- resolving to "void",
> +                * which breaks translator compilation on kernels whose BTF
> +                * carries type tags.
> +                */
> +               ctfid = dt_btf_add_to_ctf(dtp, btf, ctf, type->type);
> +               if (ctfid == CTF_ERR)
> +                       return CTF_ERR;         /* errno already set */
> +
> +               btf->ctfids[type_id] = ctfid;
> +
> +               return ctfid;
> +       }
>         case BTF_KIND_VAR:
>         case BTF_KIND_DATASEC:
>         case BTF_KIND_DECL_TAG:
> -       case BTF_KIND_TYPE_TAG:
>         case BTF_KIND_ENUM64:
>         case BTF_KIND_FUNC:
>                 return btf->ctfids[0];          /* Ignored for CTF */
> --
> 2.50.1 (Apple Git-155)
> 
> 
> 
