Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3B5212B31
	for <dtrace@lists.linux.dev>; Tue,  5 Aug 2025 04:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754369494; cv=fail; b=bernuXxqCT3ZHtORZwYK4It+Yp1Fk2GkUr3yr58oSahkq8RHgepgSRbsrD1Bt6eaMHKT+1ZI0b0ZxVGMyalbMlJ8XylYV1Dntpe6FtYgbWkIHWmWNqtM5bBgMq6Vo/tQ3izhLos+fxzXTKdlbfXZOwj+OauZPlq9oB0188RIAyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754369494; c=relaxed/simple;
	bh=fXHw6P+e845YK1WWznu4UwhDuzDAJX0an62aac+mGLU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=nPVYHoPspqH14cxxcFOjHZcfcN64jieh0RLdjJzXfjwCfL1vmcfka8MIZUF35i3bzGcI0XbQ7nTD4YXdGeZstXEXjoO4mHbJk2AsTbVUBWIVH4l8lM2hyQm2TLFOGHZxC0Ge4AI2FyIRQ1IJ66ShocQ5MECEN7s9ykyp3o8sseY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F/0g00l9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JA9f9e5q; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F/0g00l9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JA9f9e5q"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574NgBf2024910
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 04:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=sqH7fKHjLMsu/xaHUMZu3t4jPjCJsbVX5RZxlMmE1zc=; b=
	F/0g00l9Wsq6vqDMZ9h+wHOSHOfpoUDZVl8FhjpjOPtjfbYXTcGz5hLPVhO24QsD
	+EdXABAReuQSxevuXgWHHNqPgjnNOMBbZ3NcE7cmavL7GiCW0qy/atbQoxsahNv2
	u86oxfXsRINfVv3aTJOO+9dKWrw053sc/JS3IOVUlGFzCaW5qo0yjCzz90pmPxLZ
	82DhjFII3ScBRSEsoRM4U0zzzJwhucjN8gyu3XGt7lHH7pQLArInB5SOUFkVt6QO
	hxEVKOdT05TrVOJ/KUIbwsoonHNLsb03hTZTeT8+bwTRx2S/DOE6GrqAwrXscCGc
	3C99VIicrQs9bjbXwKUz0A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4899kfc081-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 04:51:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5752a5uE025382
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 04:51:16 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48a7jt7u3n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 04:51:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNvVW0wekspCHPqP7iCcR+yU1yx8KMeeKx9FQ/n17kesum7XT/oJjbhRwdRfrVaUQocMHx6j1qsK5UlwRCN936LPlRrHwZLX61h3yD9ThNzpifHUU9h/MMEYEb7PTsLwba8+zD5gczlJXzCzqTwx2hgZz00REIyVVpu0LbmWgM+M4JFOvkj0I65wEdWPCQUS5salFq4mBbiwciRyt9WjwQUQ7Ms2StSSVRjcve9LpoZiJoDuCbOH5nbNSXS/qSjqMQQL6E2cuavVrgbd5cPZthnLm+KtgyIusiTEUi8GaNRUF5+ZJ9GlOLBG1idqloiSiFgvEsTTpY0KJZT579t+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqH7fKHjLMsu/xaHUMZu3t4jPjCJsbVX5RZxlMmE1zc=;
 b=qFW49XLABCGhbw+C1Nx3jjDxSYzK5XVacV0aO1p7fPXySM6QveF6+hshE9EoCFCtq0fIeLrzTDpLXGMtuXtgl5QdFMLhDn5zZQNcNCsYJnCEAu0/BUuNZCiBSpwU7Q0jKLlXHvlg/9Owc9DSYkqcTlRexsWovo8Q5H6njFmxEbHKcWA1ruUAX8vXFDw37CaLd5HEfkWaRLCZNfL7NOdep3+D0BV9wKTCMk/+jnWwGQ/ODm4D84TkS0wKRpF/qL19o9dRZB0OGQTr9ilQnPejjLXtuvdSxjmuXJfQJO3cDAIbagh4zeIDL57dYfYJWCV2NkEG25MZW/FOTHTI4S4oGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqH7fKHjLMsu/xaHUMZu3t4jPjCJsbVX5RZxlMmE1zc=;
 b=JA9f9e5qEyRapF5s5HTnUC44+EUh8E0LemIK2kHQaEORKmfmtsuYALuFw1x0oCLdDEyUh0OWB4wglRV6fAuOycpTWMybGhUb/C1Dm4OzYzo3AUU3rxqAIcaAEnKW1y2zKHroRRxJRmD8O/eyUF6TYDmRPSZPjJBNqFkY1pnqi8U=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4455.namprd10.prod.outlook.com (2603:10b6:510:36::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 04:51:13 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.015; Tue, 5 Aug 2025
 04:51:13 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Add function name to underlying return probes
Date: Tue,  5 Aug 2025 00:51:11 -0400
Message-Id: <20250805045111.9607-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4455:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb96ab4-35cb-48be-08f8-08ddd3dbb425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xlb2CtsEJRBGX8rHYDRMYy9MzEmuKrZf4y+xzmYbCXNN51ngwhewVcR8fkdJ?=
 =?us-ascii?Q?yXLM2VzkoKbb1HacqTgIHkUEJGUjVU+9lj3ViGNmk3aZ5hZfUoQyVhGooPrU?=
 =?us-ascii?Q?DhEvBAqtXpT9OhOuNKT97zcdo5PQ4IK17aRYKtVrkIN3Su2TnjUladO7erNx?=
 =?us-ascii?Q?h9fiAWGOhbN8WR/TJGQg/2AdLvIdhtpYeb+WA0yTmXkJj+/jdGHNEXpjm2Cm?=
 =?us-ascii?Q?zwKiM/HzH0zL4cmSTOSaOML5NgnMtt+bk2CtX9Du2QRuVBMrTH3OI0/peOq8?=
 =?us-ascii?Q?6eSbSjgt0QvX1xKjhLR/rW9QPTEOd9AgY7e/scZn0privY5IWu41EQxyTAQ+?=
 =?us-ascii?Q?dTthtB/Y4gCGK+sKn8H1s7alKU0os77nm2QVePrhaIk99DjmjoWFTwqdmUor?=
 =?us-ascii?Q?RXnihavWG7evpz3YsUa0S9IPU6oO75lrZzgumj231R7xFv2F4eZEU7yh2Zcp?=
 =?us-ascii?Q?O5ngQejC/ghXmnp8EgOf1mnee0WLlQrNBf2d4Izn6eLuxmbBlhxQ1djIJPbb?=
 =?us-ascii?Q?DxDu5w+Eilwe0xRsFnw2WccZfhQwxA3qLTovWSzJd9baFKvbv9r40pCLp8pF?=
 =?us-ascii?Q?drA8qIaKl3basnBa5M96GpmE2elKV6C91aj4ZcpOYkWFycwQYIWGLf/Dtqh6?=
 =?us-ascii?Q?/qKuB09RZtMEICUkrg8JPY7IrN5unN/dVmQvcnvwsbh4tkU/p6bbk0aG6UZI?=
 =?us-ascii?Q?/jmD3tw4xzHesfFcQ01TzS1P1exliJ4oKnQEO7um6jFmkYUPbwNhb1uKzFPS?=
 =?us-ascii?Q?FsOabHTLdXwmwJIJxUPkTTVIVEX70ymOyq8S4Aw9RGQ/ezYORkVk2ZiIbfPw?=
 =?us-ascii?Q?/P06DKuU+NHzj8MEtZAhbuzfZYpJaZNQGeeaBtuNzA4i5++hpe37zmNaUKOm?=
 =?us-ascii?Q?C+Hg7tULYICoHvMZsikAerg+JUlUbPh6ETLIDqhG2fQsNC7hjtiVbde1wXcm?=
 =?us-ascii?Q?cmFOMU5INLWkn01LAV+SN07Mk1CmJS8sScMpvwo41TxHQvdChi3Q2I7jpRdu?=
 =?us-ascii?Q?eCoyLnjgY0qmEB2pcdrEJ0IrZaq4e17QORpfMP/K+6M0ryQ0/PRtubfnmSwJ?=
 =?us-ascii?Q?IHgjI+GwRNpz3QxduYzMUM/2TIz7/W90taDeonDDdNEl1cFfFk5ResqETHaO?=
 =?us-ascii?Q?gR4kWvkqlZI3S5zVEHufL5lr+Uyb39AJ/MDNHWf1kB7wvnQFqKTULGDYpQ7t?=
 =?us-ascii?Q?Zr0/1yjG2iACwmIZBlxXpoLoDcAgW2dXK5zOlPt/z0C2wS3A5Jd9hopP9o6/?=
 =?us-ascii?Q?EV96z1lMG/7BEDtFZqkJpTZBZYv9oMXMe0LgBNJAso83M69l5h+Z/tWRi4ZI?=
 =?us-ascii?Q?fI4WPjdaDD/jWCuztGz0Dg3O09yam6rqV4UuOH497bk+U1zHZikcWYF3xHCX?=
 =?us-ascii?Q?kKGApev7PDdxo4x7SXaSHNzfjIu2Mi5coc2qh0ieSRQLJBpWWBQlhN+onYD9?=
 =?us-ascii?Q?K4XFmLbIKWM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fuAbZwM5sQ9oZUYZ4bjdG8lY/7CC+ru82dnaibR7GOIFE8VgtQ7R6BIJ2B24?=
 =?us-ascii?Q?LCSquKMEDE0spEUoR+Gl7PiYWDGJmJxASXd5AMx9APSCGK5oKPGp3rQaJJyK?=
 =?us-ascii?Q?ostVlgoI4/NtwgpMvvvb0iQIK+bMUVw6KzlPSgAnieV+Kl+uj4cH9ZN6o5M+?=
 =?us-ascii?Q?fdmGW5KuYFS9QAYrA+Q/mNkx3lwBVD8KAw2jJOHrKoOimBwdfiD8pyJN8P/Z?=
 =?us-ascii?Q?B7a0/1wxGdTKKsh8GDQB869e7WjMZkUlKjaD4LQdNL+oGpnl36nJXp1LjQXa?=
 =?us-ascii?Q?MO+tU0EE8ZkHGBBTaOh+RnaNzh6ay1CTUIoWzRXUSRJuPRrd5FbXMtY5p3K9?=
 =?us-ascii?Q?NAgUCVepe4b8jCogZ8fqv+4IyHUvCXFYSuJ99voSNSEoFVGNYBP0th2WMop/?=
 =?us-ascii?Q?VNKyPWVb/X4sy+QDhOcvd1UopwuxuUK1ZTH7XjPKQWlhrL2BD8ZSNjiHQH0e?=
 =?us-ascii?Q?rZL919Ndv0OxmL6mBQzJ89G+VMRKKhPa5+Wch1ajByCUTAfPy7kg+B0XOpdY?=
 =?us-ascii?Q?Q3poaBRj7d7sDed+U6rurajBATEfwNlEHNUE9YqBUHGd+KCPmZJ6MRSQ9BID?=
 =?us-ascii?Q?MVPZ/cg9EEMU7p4ActJcj0S1H4lenseY55jPYRkhZ25RSNnXLNHp07Bdkua1?=
 =?us-ascii?Q?6mGvei6KE8Qx/7TOzpdeRl9aqhPGiJyWY8na7nRjOOcxyZgL0qCdg8jFoVSy?=
 =?us-ascii?Q?v9b9sfDJQXi4/08AQtAPqjZ7/sY0mb1oNPIKxnjC7gPBfBXVqVpc54l7B7Bv?=
 =?us-ascii?Q?ZdS1tNjy3Ht5ixQXAcWjD4q7e1ugyIRjtzrK0sLeoDmN1R0Lz8pFSvTjHOX6?=
 =?us-ascii?Q?NlkYAb9X2i1VXr1mvWWZgQDXu8c/ajyFtJqS9L4qdB1EouGnQANxp2JHjhE3?=
 =?us-ascii?Q?9Vo6rGdsEdSdZvZjacNQuzsbRVB43EwtdVRon430ftI2KK/z6lHRMQj/078u?=
 =?us-ascii?Q?SsGqxatX0iJ0TRt5VPZfsg7tjbEIv/Nk4SXxOLthu1O5AoDPEbbstUzBUAZB?=
 =?us-ascii?Q?znVpksINmJRPF+TbTywKtu0vboOOkBdLW+6JPO01mWL2zI3M+vsnhoHMhRac?=
 =?us-ascii?Q?XLN7giTXmLITL2sMAbNxXesq399Q40Az35cvBkDVfPF3qU3fftP8vD6nSxSt?=
 =?us-ascii?Q?5V/S7c7q5G2yWwT5GWQNX8+80GdHxYH3+7i9pV3+MN0ArqiZ25ZMW6wJKvU0?=
 =?us-ascii?Q?YEfqdEGi1ZKfV7MbeYaDQaQCvz2ej5jQJ+mt+LwlweU/oXkvMIDxpJNwSeQ0?=
 =?us-ascii?Q?EUeBJ74yDNUz8AMx/UurLF30tQ3TulAKlAh3tl6ENuxFmNbVTWpM7WZ+IKTr?=
 =?us-ascii?Q?dAbUBwwcH9XuPjDTfMQ1PkDDx5BAIJZlSBeKI6WT801pf83bv3P7MSPZ3GDg?=
 =?us-ascii?Q?pHNZE4p9yyYhrLxHeNAG09eVahVVYETXDLJdUxvvOT2yU1lPeVeR4Hbn3JlV?=
 =?us-ascii?Q?5f9CSpai/LbEm2/PQ305W17e+dJZecsH9E2Vi6pZbpiZgKNcIh65Agu+mnqD?=
 =?us-ascii?Q?TKlPFjCrOe5TFTbTwbnu3gEadkCeGaMk6/sMVlA0h/Rp21FKN74G8909Q/FG?=
 =?us-ascii?Q?KjCfy+S/7X7F/ycWMNFv50B4xOD84cnE0xYfAm3J?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FE+ta7/RrQAfxPTuyAwBXLDeZxrXQ8SuzE8kon00/WFhiMScm/6a8EZoZNhr09fmYhz9Nm1UDo/y3HBx8t4H3PRVXLb4NKC0QrusNBj4cF7lDFES3hhbVSuXxJVFIWxTtnxzxZDawze8hqAy9c77sArW60FZuygUYKB/SSr4/8kJ2QuBNyN+6/FCgNzNo44HVKbA4WYaEBJgXgM/gSoWAhzt64RMzHiGHCGgnxCD3siZLLv4lulPtUTn6UuQ8o6gNUVOXa4eUeIE7AgO9avgK4sLbKvUsqFZG0uUIulglH9Wg0VXcTpgKEp+mi6YaGnwKJexOG4d+miltejMco+K+rv9gcvDUsDkUSJkLB2er7uNDZvU+MyABZRG+6VrGKr4syY/O8w5BtODi1lFJiSxP5GyR+9+VgZZ2wODv86vbhv2UJ2JrI/FzKWMCzTC+7qzONI1Q8L88XN1e9FLSxSvupLcWdO6ELlngGJ26J6XQXIz4m8FpOAWeS50qO8JgyDQgJwnmdDe2DTd+w2ZfuqUyb74FmXJaeyZVM38HE1xr2VAH1pLyDrKCdk2kQiXjGdkE3NuRdwz+c3+LBh1/HtQ5pSiN8nSBpQkK//A8IwvNDI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb96ab4-35cb-48be-08f8-08ddd3dbb425
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 04:51:13.2325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQDpM4p+cXuYkbf8IFTtXl2Md664pOeEejleLOzI5Fh+mX2tgg1eH9MNsUTBhMcP6sBATa4iOZUYUK90yEfQBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4455
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2508050033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDAzMyBTYWx0ZWRfX63/qbzkj7yL8
 UZH22mEmNxosXXuQf3sGxoKBy5hJUm/lSyJ+PyJoNlGjlrDkldX4Ieg3v4Enssm4pDo4S0THjl9
 964OPh8wD0AMWNTUqtZ7jiXao/qZGbzXuvrdnwMTqWndb3qHF4M9GsIdJvWUYL8K++sdwldNpJk
 NrS25NiJdbzsK+UowOkIWboT36jP8dkmWqDQs3H8sRFib5Juy1/UgZAP+gRqEOYRdRaRtSBdjkX
 8FCt00P/rB6dkfqqDS+TDrcgoB4VcHDXTEYNLZMgiQ3Iq2xYsQmBEUZjky9N0ZQhLWU0MDYUELB
 2DOV5kYzc90fLB2sy+QOkCMWzpOdIKGGr2DiIhD2Pan7NeK8RiBo0EDUVKRidEgBC+4ourMgOPc
 +AlB/4dqzAoWDhv/OghH5YWlzuRvOsJ+j4YvKEgc/vCpqDjRH9a1/HxQpDLBMcfpE6gdy/Ox
X-Proofpoint-GUID: exmD9-7w0WJueQI0oQXs1Mvgdku29ah0
X-Proofpoint-ORIG-GUID: exmD9-7w0WJueQI0oQXs1Mvgdku29ah0
X-Authority-Analysis: v=2.4 cv=VMvdn8PX c=1 sm=1 tr=0 ts=68918dd2 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tyH8V26bHf4hJXxgQTgA:9

From: Eugene Loh <eugene.loh@oracle.com>

In commit 35a4f05c2
("Add support for pid function "-" with absolute offset"),
function names were removed from underlying probe descriptions.
That was so that pid absolute offset probes (pid$pid:a.out:-:$absoff),
with function "-", could sit on the same underlying probes as
pid$pid:$mod:$fun:entry, pid$pid:$mod:$fun:$off, and USDT probes.

While that made sense for those probes, it did not make sense for pid
return probes:  their underlying probes, all with probe name "return",
are no longer distinguishable.  Further, there was no need for any such
change, since no other probes will have the same underlying return probe.

Name underlying return probes with function name.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c           |  7 +++++--
 test/unittest/pid/tst.multi-return.d | 21 +++++++++++++++++++++
 test/unittest/pid/tst.multi-return.r |  7 +++++++
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 test/unittest/pid/tst.multi-return.d
 create mode 100644 test/unittest/pid/tst.multi-return.r

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index a633b6fe7..3661f09d9 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -906,6 +906,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 				     const pid_probespec_t *psp)
 {
 	char			mod[DTRACE_MODNAMELEN];
+	char			fun[DTRACE_FUNCNAMELEN];
 	char			prb[DTRACE_NAMELEN];
 	dtrace_probedesc_t	pd;
 	dt_probe_t		*uprp;
@@ -923,12 +924,14 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	 *
 	 * The probe description for return probes is:
 	 *
-	 *	uprobe:<dev>_<inode>::return
+	 *	uprobe:<dev>_<inode>:<func>:return
 	 */
 	snprintf(mod, sizeof(mod), "%lx_%lx", psp->pps_dev, psp->pps_inum);
 
+	fun[0] = '\0';
 	switch (psp->pps_type) {
 	case DTPPT_RETURN:
+		strcpy(fun, psp->pps_fun);
 		strcpy(prb, "return");
 		break;
 	case DTPPT_IS_ENABLED:
@@ -946,7 +949,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	pd.id = DTRACE_IDNONE;
 	pd.prv = prvname;
 	pd.mod = mod;
-	pd.fun = "";
+	pd.fun = fun;
 	pd.prb = prb;
 
 	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
diff --git a/test/unittest/pid/tst.multi-return.d b/test/unittest/pid/tst.multi-return.d
new file mode 100644
index 000000000..0f81f343c
--- /dev/null
+++ b/test/unittest/pid/tst.multi-return.d
@@ -0,0 +1,21 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: profile-tst-ufuncsort */
+/* @@nosort */
+
+#pragma D option quiet
+
+pid$target:a.out::return
+{
+	@[probefunc] = count();
+}
+
+tick-2s
+{
+	exit(0);
+}
diff --git a/test/unittest/pid/tst.multi-return.r b/test/unittest/pid/tst.multi-return.r
new file mode 100644
index 000000000..bf885b28c
--- /dev/null
+++ b/test/unittest/pid/tst.multi-return.r
@@ -0,0 +1,7 @@
+
+  f_b                                                               1
+  f_e                                                               1
+  f_d                                                               2
+  f_a                                                               3
+  f_c                                                               4
+  fN                                                               11
-- 
2.43.5

