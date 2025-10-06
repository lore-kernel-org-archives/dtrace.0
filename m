Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA05264F96
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 21:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759787868; cv=fail; b=tfMxpGAigxQfDiRa1mGmTBnzbc1HRQzMawOxm74oBi770iB7E9HkfIyRgZshRHqeD7j5b4fxmtlgmWvpUYBlKn9OFS8ex9cmmCp46gdTBLbtzfoRFE4gHV5ornRNRarj0+2p+ILQQB09TB8/MrkJfSMtrv0CDmkdmsSVek2yK1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759787868; c=relaxed/simple;
	bh=nDGacppwC8QvlQKPDAoMcTawvqPsGvMBXZ7zX03aJp0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uNU9PfV1cwoUGyAovjYoBLDYm4eoFRf1RMnxcUVWGSjJuDLEUyFRx+AN2NSBl42zO0uQmjbYkigk3xGDm0E3dZkZtTGNg0tkBw4PMPKzAa3HL0765w2bBolNrI46ZlcO80xLT70ABhVQDL91XkcQ7VHZ2liJB2lz9SDMyJfBnmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l61bm2PS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YSNyzhKg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l61bm2PS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YSNyzhKg"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596LTEwj016260
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 21:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=iNChmI2r4Fm2rLaXIr
	JTOIbYAKMEDVDvHy3WUUbc3Eo=; b=l61bm2PSucxAL+b7tZppjM1spGJbJpWWpU
	1vTNv3rl1sFz3BDd7RGW8kPx//N6aeraiRxEX6WZpl3MLzXNK5Z5OsuZ8FwdaKSv
	dBTtaCS6gL4uPnQBWLKf3YRfn6z3rzgLx7/MhPsVSou9iohRk6rbmDBqoZ8kB+Eu
	SoAoKqnCCPuS2T7XnCZPEaCnX5+lqCnZD5PXws0II20BIimH5iyrMHZf5/dvsC4K
	u2A/HNJm4Bc1apadMu69sNMo5H72DaAURR43W8V0gTlBJA5PzUYI+m4SWjxcr3Ig
	d7l3RDgkMuo6g5ld94A2oQjvDV7dp4XOEHTWDKnyKqAolz33mZ3Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mmacg6yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 21:57:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 596LWssC034923
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 21:57:44 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012042.outbound.protection.outlook.com [40.107.200.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49jt17dq4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 21:57:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXD4TkD8FtPbKTeq1oXa4ZgNXCK0ST+DzU+k/fCDjV9kw6i4m23JlpjqmMnNwitJOKDbTvOuOkk0+w5JDMFyQXVy7vhLc/eKN39+4vFT+Msqgx+IsfSg5dEY+LPulP//bUwUFFxWVpMjd6rZgyTfGp+FZ/08ZEHDNmUwePBnWT3KJrKxYUfnpP2BG4zr8mdT8Ohy6HbR2k0Z0ux6SahR/PpmXWlV5uQNFqMQVTvJUkPGY78rYc75zTjjN4H3sppxiwCvyLZ2cNttqpnGjwMSiKZ9+YY0AGCzYuEnJPZHAcMD7CVouxYWxI3q6cIfGJsgAjY5nepvH3E6rgKUvRlXyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNChmI2r4Fm2rLaXIrJTOIbYAKMEDVDvHy3WUUbc3Eo=;
 b=MfE8xJ5wGXuTkoymi38FbIdOAA4n/jCBN3Yc3jEStUY9ylLxlQkfXCiX9QIvgmHtQZe8XdfIaUJ5HKXVjbsLNm0cUKfKuilUwv93YzIjhrWxNn8857eFV6sTPad1yPtPqno1yeoMixT/R433OVSNuDZRDUjr4DYX2zHMa3uQqDpY4YZ7yjFmwouD8zCuSyS9vDz4YenjLJVonpmR1pklsvTExWfZWaq58pOcDa+8EHW7MeJd0rMSBkt2jw5M7rCZ9THaCqtMLsveYjnfh6Lq1KaGTjYXcgP4+5ERBaLUfIcdihnCnScy+K7Sb/NsPOS1/7wKAKuhNHCdzZmjMHxUZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNChmI2r4Fm2rLaXIrJTOIbYAKMEDVDvHy3WUUbc3Eo=;
 b=YSNyzhKge+kg0AKBCqRY1EMRkPiE25jXQaZ829wSa/yR0Jcd6Tgg9udCpxGT+NaKhJ9yft7l41N97jj39Bzn8uw8NEFcGedKaPGNbTA7UNJ7GhfW0je7B3KXsKo/Yyj/HP38MzmzMriUcpzYmEXLmMHMxAuPjsRNSO747QmMoPI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN6PR10MB7997.namprd10.prod.outlook.com (2603:10b6:208:500::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 21:57:36 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 21:57:35 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/4] test: Supply XFAIL for tests that use vtimestamp
Date: Mon,  6 Oct 2025 17:57:25 -0400
Message-Id: <20251006215726.8893-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251006215726.8893-1-eugene.loh@oracle.com>
References: <20251006215726.8893-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN6PR10MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: bc306599-adb3-4e73-1ee4-08de05235bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d3atdmGeBIDqsHLcZjrlcqrsVkjS57U4flE7QkqH5+pXjQlFa9h/vIGJn2Q2?=
 =?us-ascii?Q?CjeVY6m46EPfPMr7w78gQ9ZWkzd0Fx1E0+J3aLCf572+Gsb7XUkH+cBmK3cd?=
 =?us-ascii?Q?TsAEnEAhxY7SVpWF54odeKJTSdlsK9LJX3iYxGbK/u2ffnK5kJCeMf210eex?=
 =?us-ascii?Q?ebSvad7q85eu++cHfp0gjDkPi5HV3OoaJdK6mJwCehztZtCBcoxeYXPmYzPk?=
 =?us-ascii?Q?5mxU1clbQtPhGPT1y6cXMFmIHtCol8m0lbfps7+dkysJYASYECQGAblzg6it?=
 =?us-ascii?Q?Li81tZ5R/jr6RWOAQj/3CSdj2GJyCj0yV3Y5wpX/Gg8Liq6YbaOc45GifKWy?=
 =?us-ascii?Q?ffXS74CGBxdN7fB9X5ulVw4pQDQnOMMttepWPDwooK/iwlaH2ky/MxjCV2mH?=
 =?us-ascii?Q?UvRe0tpzrkPfQrfb7Pcid5caeH3cguUPHuwscmHuJ24DjwkZ0xMhHFMcsOaQ?=
 =?us-ascii?Q?wAylCn9v3ezy9S89ou7TtVX8mKX0gmMjBaCAgT8+N9eCED2NG2p5arH6g4Xj?=
 =?us-ascii?Q?+ji5gCQAnj6IhsIDVlrKiiI36GUCkvzYeD90UoY96rsb9zeLeGMsiF375M0/?=
 =?us-ascii?Q?lJ3XddMcIk9sr2tKuK7afFIlI2A/bAukvf7UShLb3N0cTYYOzKoPQM8gpCdl?=
 =?us-ascii?Q?JZYUg2v9xEPSBwCIwP+1tc/or5gjiTFMhdCETXKmvba9aff1ut4QNtWHrv7p?=
 =?us-ascii?Q?hk39moq/lZ6tHCSOBXbR9hrfOWWOYyRDz0EHI6DuFkmkHcJmP5Malw2j5Y7A?=
 =?us-ascii?Q?o/co+S7Bk4UJON5eR2Xe1GThipymp40k8xkOkSBdPR1fwPX6sPnqxM+kiDur?=
 =?us-ascii?Q?8ITW/YzMX8Fu1/vEpzbb+KPYsyoWSxfJZNci44Q5rGHETv/J6bHtbQZID9yC?=
 =?us-ascii?Q?0UtnhR5MwY0QpfoaR/PAL7QIB/b9gbw+N29eZjRtwqMaL+KTFI5uErJDCOoE?=
 =?us-ascii?Q?1A1jH0Gnaq+16EM6BZaVxUKdmdFe6dEkUfA4XTXuiRVrorX0epCowj5mo43M?=
 =?us-ascii?Q?zKdjsM7w0hSKOET/FLGWQO6puvhGq/7qOEIi2GNi+zCW7ESRaZt6n7eVQ8vO?=
 =?us-ascii?Q?KEgprqNIrDJCLJpAtDo8NX9JIuIuMGZoDvx9MfscnF6Q8BPP9kUFP/QwKz/9?=
 =?us-ascii?Q?M02rihJYbs66OZrcuwehVlw6uU4eLacSFjrVFKvY42N4WIYxVzKUviK50sqG?=
 =?us-ascii?Q?vrxambx30yVVNxLumItaHO/6RmgHP4T4tFD6FgN55u9CWLcbq9BHLZjo7KUo?=
 =?us-ascii?Q?a+ty3nAHrmunNiIEYgZe41OkReXNet/4N9k61Qz5Kh4HUBxue4AJ6sMIrNMi?=
 =?us-ascii?Q?5mttHr8BDhR7tXEY9g9RO3Mhvq5zteYa0D3kJF49k0Xkxu0xtoyEnHAOQ41b?=
 =?us-ascii?Q?IowjE4DTrQJPBpW+CsJBXF+91zh4qKFd8e+Ay8FuHkuBHGxJebhP9/kLzEc8?=
 =?us-ascii?Q?rc76e2qgPpOv6JktcNVFjzSJforq9Bw491bXxl8w+ajVjTseQ84Xug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YNodDCf0arr64RUirikHV7f05JrgchpkT/QTtnf+E8yZO0g4dEEGlM6SVpwv?=
 =?us-ascii?Q?+MA4v3jn/i1xqirqvRbUPfPloMXLgDtZa8tRsIRrGtECgXuJCd5ZlYEJu/kB?=
 =?us-ascii?Q?cqzDEj5J7ppq0p656fRD7hMwzX0aVWbv9tp0j+FaJaH8L8L+zeP8xmk3LLoB?=
 =?us-ascii?Q?PqHHwptx1u3Nht9H1QCGqjN7+w4PR0pH0h0hz5CyQTdYGmEvPdYmKhN7Ho8I?=
 =?us-ascii?Q?ffBeFiJ6hME7SW/tQ1nJHzNqpuuZR7ehy1kX9+l8S/+057kB2WJWEKprz9Ry?=
 =?us-ascii?Q?/cM9RgDMvR+JmmEyKeFqgoQIsfATQtTIylpx/jFriUz2CTBYRFMLWA0HzU2L?=
 =?us-ascii?Q?pXIIyfVYRSw2JkVRCZXxV1x/QbT2yPlMizoqr5FoB7D49m//8wPqDC/+cIBU?=
 =?us-ascii?Q?5UGL7Fr+Kfg5rsHJd7LyGNFbJcWzGLPZMDq8i80dxfyhA4hzuO800wqh+P3v?=
 =?us-ascii?Q?KSZzGYwpcnjE/7xbY9+7qwtuqkh175GzlMmUM6HP8RzlhCEtSbhkz9b+yfKc?=
 =?us-ascii?Q?quJvTTph7JlusU47ka30E6LW4XCXH/j/3FXIWmrWhccjAmVb5Bm70GyCj5zW?=
 =?us-ascii?Q?6aS4CqMGG0jmW5Xr9WDAIurZKuMCzjK1BPrWRRGcYRXhYxwYKqWgk4HC1iPD?=
 =?us-ascii?Q?o20Q0ziPYHQQyp7DrXmSWZQfXvyI+rIVGTr2dqimZcpTIWJG8tvQGcinSQ81?=
 =?us-ascii?Q?+7CwkDnXlavQ5W4eplqSCSHF2r2vOnlGFD6odyjdA6t7ehhsKtn7zrfMhO10?=
 =?us-ascii?Q?2eWc708HGg6N386YtCli7gMh5R9vl3Lci4z94mxENKjZVXnHHAWu+yOrDagz?=
 =?us-ascii?Q?kmRCGB9bGxDkDjIicQBO5TL/R5FkOLOVFN0sN/vyf5iDUNMY0pZVs80UiE+x?=
 =?us-ascii?Q?16mNYPCobQ+jDlBs5wzBeVaqDGLu5zMan8osoQ8yZ0EpZIC6+S0NGpIXHJr6?=
 =?us-ascii?Q?raz76MQP12wWvee/vc9CTA/7zAFP0u8nb7zIjUcIf4af8R8oE9YyPtELl599?=
 =?us-ascii?Q?Cit/huBj8MWS+HxSv6lx/LAgdXqAC6aSYVgQtiOrgRCevEbTl65QTSPG7JEJ?=
 =?us-ascii?Q?bw9wZiT7S21Dih46wSOGt7SxlUos259L/mKJnrnsxnScYOgxpq4w6IdSnq3c?=
 =?us-ascii?Q?dqzcYzzZ9noRdc8YVgq57lj648UYCMPwvDAKz3ZvgtPmfR7Z/JhkAcbTmNrf?=
 =?us-ascii?Q?wnc7btBo5hcGl49+OGoNUGUuaEjCWf/GoIpg0mlzLnHERCStHJlVGxJD3HwI?=
 =?us-ascii?Q?9FsoujVykGoyEwgD9ZlEC+cyf4AVsYnw4SkGNtFoc8seWv7grv4MoNz4f1tJ?=
 =?us-ascii?Q?mp7Xics1k6TILUb/nEdZtIyhkWXFGOKePRPPo1f6+AnLNMX7dVh6d+Ew6jr3?=
 =?us-ascii?Q?Y6vIrc4LsYkB9lv4Nz8uI+C0o9GRqR6SBFIgyoivQWtwpvwla4H2i3N7JeRf?=
 =?us-ascii?Q?isca1BXU711HwfBgHjjRpxleokSAGqX1tl6A1tVEAD6dBXZjYrXzauxEHzu2?=
 =?us-ascii?Q?U4D3c+/Dcac7o6Sy2b9SAvyZKtoXbzwpVrCsjGUMzc7ZEZ9LLYitQOI9eKC+?=
 =?us-ascii?Q?vLVgvvGfh+6vvvtzOduq4nhVjgnpiu6PsTbO1oNc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vteITLs6BQuXia2cZhD5WHL0QSHnhXqbwkvugHF+iu9//ZPxAgWc7MCTGYmWHGld56il2VctapKXfmrg/+YjAUB+SetMbnAUDxMHrzgId1ZgxnAYx0JiAHZovRZNBN0WgKY6viyYTFzJWiTJAU3PziUkjB29VbvBRRU/8UDTAbTx/dsdPrMcMHymrgC9JembdSJ49FHG0hNlNPeKveiD44XnoEM7Iru560MUtlEuubmPHia3Gn73eRFsNKtri+X6lyPTV6DUTkbH9Tbt7H6eB4QljVVqeBvsKqqTknHQTyfPWMZ5dsG36moDOkgKgUOElmqzfLdZbgGh6xdpGeRlOUvDJjZvvf62DzD4lNyFVDYPle1r+ON61gCGc2kaVcr0i/L8QzMvJXVyJm1iXzQVFyKmFaM/YVrFinB63kwOHSRzMxnHOelZ22J2CyXVhi0vtfpFyCRUr0K3+fX/HU7F5qoAw99AXYnJoVCpiVcKOvkx/FW/t3yeBpBUbZOPbJPkZWLFv2Doa9Lx+c+274+V9tg5YYzdGlQTswCLQ59B0v4q9sfGGHPMrsp58zbuM/kt9e5xNWbNr4jpaS7oBN+lp38D4X7jDOdBYGImgRWhFt0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc306599-adb3-4e73-1ee4-08de05235bf0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 21:57:35.8855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxovtkizt70i4pmHcCOWSnnxIpKx9McHZ0LRDf2RJiKq8JGOJyO7ngNa5pNGhpbbWUyIwjU6g40ZL88C8pM+5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7997
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510060172
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE1NSBTYWx0ZWRfX6RE3h/z9wxr0
 8VHAd2J5ClvLduelFGF13zMQbI0/XHNChrP0fm68YsJgEyveKS8znZLg9J0Qk26dU2MA6uxV0as
 S3r93LNP5PfnMH7LH+LVhmEy6/a/0DNuOyJ5BAfvthWyE7/vMTnFXaq4sLcS/CSS2ikf/JtT6CI
 x6WhgsjJtF0eJJuhzTTHXiFa0eXc0QooBfxhZk7tGWOVtNjbs51B7W9cMy6Y/Q5pbwRbeBKGlYg
 2su9ac82ekdXqX9pjUywCa4swEJYhPFm3ha4I5tjtW0p7voLWWvramOpw0B/+sqtRKaxuy8ikKr
 7ERneCzq18HIbhcJIU24CQryZyJBo+eGt0s4Zd5B8QVYlengojygYOPeHcgHWt3yX+84KtXdaJj
 X3DJb0Q5pr7jsk/LS7kXAOUR+I9/dRi5RJSnuECoJvRC6l4YRdM=
X-Proofpoint-ORIG-GUID: VrXjNv0aAHeFh6y0lBwfs4aXAkBH1OAb
X-Authority-Analysis: v=2.4 cv=YqwChoYX c=1 sm=1 tr=0 ts=68e43b59 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=abun9zoyLrql0K9_ySkA:9 cc=ntf
 awl=host:12091
X-Proofpoint-GUID: VrXjNv0aAHeFh6y0lBwfs4aXAkBH1OAb

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/stress/fbtsafety/tst.index.d             | 2 ++
 test/stress/fbtsafety/tst.strjoin.d           | 2 ++
 test/stress/fbtsafety/tst.strstr.d            | 2 ++
 test/stress/fbtsafety/tst.strtok.d            | 2 ++
 test/stress/fbtsafety/tst.substr.d            | 2 ++
 test/unittest/variables/bvar/tst.vtimestamp.d | 2 +-
 6 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/test/stress/fbtsafety/tst.index.d b/test/stress/fbtsafety/tst.index.d
index e30b94c0a..3a2e40567 100644
--- a/test/stress/fbtsafety/tst.index.d
+++ b/test/stress/fbtsafety/tst.index.d
@@ -5,6 +5,8 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
+/* @@xfail: dtv2: need vtimestamp support */
+
 #pragma D option bufsize=1000
 #pragma D option bufpolicy=ring
 #pragma D option statusrate=10ms
diff --git a/test/stress/fbtsafety/tst.strjoin.d b/test/stress/fbtsafety/tst.strjoin.d
index a22cc7943..4192bdf9e 100644
--- a/test/stress/fbtsafety/tst.strjoin.d
+++ b/test/stress/fbtsafety/tst.strjoin.d
@@ -5,6 +5,8 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
+/* @@xfail: dtv2: need vtimestamp support */
+
 #pragma D option bufsize=1000
 #pragma D option bufpolicy=ring
 #pragma D option statusrate=10ms
diff --git a/test/stress/fbtsafety/tst.strstr.d b/test/stress/fbtsafety/tst.strstr.d
index 13f4a9245..ee8512f0f 100644
--- a/test/stress/fbtsafety/tst.strstr.d
+++ b/test/stress/fbtsafety/tst.strstr.d
@@ -5,6 +5,8 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
+/* @@xfail: dtv2: need vtimestamp support */
+
 #pragma D option bufsize=1000
 #pragma D option bufpolicy=ring
 #pragma D option statusrate=10ms
diff --git a/test/stress/fbtsafety/tst.strtok.d b/test/stress/fbtsafety/tst.strtok.d
index bc0a707eb..0c5d586fb 100644
--- a/test/stress/fbtsafety/tst.strtok.d
+++ b/test/stress/fbtsafety/tst.strtok.d
@@ -5,6 +5,8 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
+/* @@xfail: dtv2: need vtimestamp support */
+
 #pragma D option bufsize=1000
 #pragma D option bufpolicy=ring
 #pragma D option statusrate=10ms
diff --git a/test/stress/fbtsafety/tst.substr.d b/test/stress/fbtsafety/tst.substr.d
index 8cd021176..ee7234473 100644
--- a/test/stress/fbtsafety/tst.substr.d
+++ b/test/stress/fbtsafety/tst.substr.d
@@ -5,6 +5,8 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
+/* @@xfail: dtv2: need vtimestamp support */
+
 #pragma D option bufsize=1000
 #pragma D option bufpolicy=ring
 #pragma D option statusrate=10ms
diff --git a/test/unittest/variables/bvar/tst.vtimestamp.d b/test/unittest/variables/bvar/tst.vtimestamp.d
index b72eb8a7f..7d92bf4cc 100644
--- a/test/unittest/variables/bvar/tst.vtimestamp.d
+++ b/test/unittest/variables/bvar/tst.vtimestamp.d
@@ -4,7 +4,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 need vtimestamp support */
+/* @@xfail: dtv2: need vtimestamp support */
 
 /*
  * ASSERTION: The 'vtimestamp' variable can be accessed and is not -1.
-- 
2.47.3

