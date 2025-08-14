Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774E914A60F
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755210181; cv=fail; b=CDiysH/WOhAbE7BrzEkpbVQ9LaU22cl8URqXnJqegavAvVjttYDJ1urp02c/zUbjocR7WshJQ9lvuR1Prw9fB2/PQ44GZx9lGbPBvnnQv26JClqxYqdGoz1noerPISURF4gZEQaK5jT1rlhkgOEJCL5S5GbRmW9D7fRC3O1Kp3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755210181; c=relaxed/simple;
	bh=uNsRoMzYbNAvjiIRmJi/ZQB6MdmB27BLaHlvlubDl8Y=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xz1O1augs6aqARG7/nIZ0mnvAoeSb5ZFbXk9nf7gJuAFAqDOisw+/MiDOD5qLlgnc7pZ/+X+KxX3t1U/OvdmQxQKtDO++PhMFjghZ1bX0lfusctEPJj3XKKUvMbLJoOw1wcXwhsR2ii3NFJG/3K5sidHxSQgGwwCy25YCGGZWhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rTptZcUq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sANRbjoW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rTptZcUq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sANRbjoW"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHg0D5023061
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=s/V4sBDxGMH0uFbSJP
	HAA966Nzdm1UD+tq4j28rIo3c=; b=rTptZcUqculsQa3HRX3hthOyiCImI+zc+F
	ooZi5Jy3TVPFfS1zAuj4SKmF73B8WmAKbJlZd0dOslVWrdwjVDABPCDhKRY2AeVG
	iMTku2wGD1EioUF8MWFJIvFqoT1nNFkcS8akhVOt81XSMguo7Hs3sEroDoxcdRr7
	BWsJzvc6DQdrGG8jWVqNsdm6kwjKK8zBepFdwG3alctdX/L3FqzznpcDmdEDE196
	uOZS4H+9GUdk4q9SC+1/4mgQN8IquL2Umb2cFFWChDpk/M6lSHUbfx26ouX9Tj/K
	TIUuNA+NFx8cRsUNCMHtKkKOtKfAufEj6EqOzAO16JBB2vDiTlhg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48h7rmt7cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:22:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EKgTIF017405
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:22:55 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsdaakv-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 22:22:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6zODkempX7jGwOSa2IXF75t7Yq3n1U7KfJenDl875J6qFViaBXMd0+x1apivxlHqjjFQSkPV61ehOqK/N2vET8+6Y3mUUPYscga0G27s/OX7n0PghPccI62Rhz3osbNUlebGOtCctM+PrF1niCdcJtR+Ue1lj8lWB0dK+Fu6E00FQl30iCsc7E6wRyu2Y09+Odb8p/v4uXoVPpuIBwGHq/jRgfG9S2JTjEePvvN590sdLZ5GUNyBgaYD7o3OV2BohquOqHFVeXMrhMTvzHvx/yT1F5zsP54p7TRGTwIYE4ivyTmVbspKmxW2e+fYUwIaXMf6afKOPS2vaTqeELrQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/V4sBDxGMH0uFbSJPHAA966Nzdm1UD+tq4j28rIo3c=;
 b=oroGrIZEaS+El8NTV1ykSdEppLv9TKfMD3kkTHqPn9Fc+wuEFucDo16MB6ShqJavj10qYH8DHXFIK6wxne8ILjggjUMT1vUiO8bLFlyGkpeKJm1Hka8XnhnTgjr7V+lc+ZgVSPbsjlGQTs6OtIAtyrycXdxxusOOYW7LAiUTBPz1Ehkz9TJ29eRMktlU9n4wY7lkxs0v4RYa+bkrGnIvtdh7qwScXFhpFpSQw9tuNGIcS0YAeekOkS7xz26UOhTK3EzWYHt5tM68Amu7xcm+i4wdOhtUTuE1mBqguYI+hH5EfTsmLM/0aGRRY/J8cT1oL1NqUAu2PH1pQ7IABoALag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/V4sBDxGMH0uFbSJPHAA966Nzdm1UD+tq4j28rIo3c=;
 b=sANRbjoWr26nhoVKpwKAUSOPOsqAknkt/ycGUwdnYNSEByS6+C3jNUHJFxMkMvy+ivMj+hLl/VsTuqTK93QO2ReOsjDdSadrajDtDIqt/kuIScdquaF+d3dHTE3lQ9vf5jH4DOS5s3N+5G/GdeFHOWbEQqXoGkX3wmdi6UKh7w8=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by CH4PR10MB8099.namprd10.prod.outlook.com (2603:10b6:610:242::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 22:22:53 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 22:22:53 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] examples: add more scripts, and a README file
Date: Thu, 14 Aug 2025 18:22:49 -0400
Message-Id: <20250814222249.13445-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250814222249.13445-1-eugene.loh@oracle.com>
References: <20250814222249.13445-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::37) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|CH4PR10MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: a02c6798-e6f0-4ce5-06e3-08dddb811ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+zzGQ7NnBJbek9E4jUNVqMDQpnvbjPhiZaE3uq8MMcWiMd0XPY48y5wnNaTm?=
 =?us-ascii?Q?HvfLYZxvT1Er98ikJdSkHBDt7TE1V0DWGyXNY3K1yebjdQoRaf08XUhmLs3C?=
 =?us-ascii?Q?74ua3hLfP6EDnm9/tuZeVjct5iR1+ewUICL8d0cpnphvKOi7rchzQl8fgdK2?=
 =?us-ascii?Q?BiIA96OWSo8A4idix0h2N65EQFFtnGinjFdLZqQDYR2FxPTB57E6l0vyGKSV?=
 =?us-ascii?Q?0+qS2skqa04OBrCXSrU8qcEn1phm9KOVPMeyWtirlYKWY5V9yllR8vFq1pS6?=
 =?us-ascii?Q?GV7IZdd1+DrEhaM5U1d97e08K+VAUWg/imjVSIZYAv4AbLAChQMNqRID1DU7?=
 =?us-ascii?Q?PNB3gtuXEyyl887b1yOGNlR9j0bIiGWndKODoyIryWSE5tX8nSjlO7UIRBPU?=
 =?us-ascii?Q?AuHK5LW8o5RJMl80emegYvajx2vz6GV9dZ0/CwmUjbJhh2uXLUEe+HLh9aSV?=
 =?us-ascii?Q?GR00FrLNREOzVyDl02f+Kf8eQ8zVuT0vuf5jZHBOB/SDyRem8u9rLHIGnXb7?=
 =?us-ascii?Q?aSa9nOaqorh9QAlKBBQj46IFYLLLHJ5oWupHIKyPJx16L4akRBAaPwL3ozbl?=
 =?us-ascii?Q?0mGYn7ygFdgXqKyjwc2fD68uiHwkc/PfrB7ze0fgcZk83r9/rWzFmXLuT0B6?=
 =?us-ascii?Q?Y/0F7PbzWTfoVoIKR0UDN65HUDD1Os+unzICTG4+/UxHjTXmylviqvqAD/N7?=
 =?us-ascii?Q?jVX7g141AhjG1KCl5hL4hMYCDg80CXTzRCn6cCPKOifG/iRY+Ectc+np++xX?=
 =?us-ascii?Q?lP11LpQchxoAwk8u6m9CeaF6C+Dj+hME9W/o26U5StgVOkksT5YAIXc1NwVM?=
 =?us-ascii?Q?9KneNdDc/zZrJjRCWauZIvCEBOHBkSu6MY+/tYRx0e5nzm4KHTEe8wkzeRWy?=
 =?us-ascii?Q?jvVtWnWzySoxEJQW/WJILebgkZRWrY9u9bquV0hYvWEaxcox18MwF7nDfDrV?=
 =?us-ascii?Q?CHkhvWZDqpTx33IzBbZkop/4WFHGJ/0erPRqzY/htrcHDM86Vfg6v6Q/I1Ou?=
 =?us-ascii?Q?2ylWNjV3bvpddAjstgjPr9D3R1DZWlBMbI5fJ5cSOWcrmLGKoKeTTH4hRZjE?=
 =?us-ascii?Q?PuphIH7OBrlQ/+quPAQHvKZKeSSkrLbVuAp+i87A6plSbzrjl5NYehUFEhsb?=
 =?us-ascii?Q?sktJd2RKetM9scqJf+ZTTzqJrJEGRq+Loi6ZwYPsEqC+so2ua4J+1yDK78uq?=
 =?us-ascii?Q?pN/vwp/mtcDfP9dArtV8bxGJE3fbDSCxhhb5RgFa6FikXX/dUbxfiV+zxFmX?=
 =?us-ascii?Q?2LQ0JtIWhXyzk47jBr4uiAgNUmk4YxFv+LhEhVMj4exTU1c/+9X5ysZuW1Cw?=
 =?us-ascii?Q?CE8rsGQyPSEDYiOf5iXEBE7tt5K2+m07rspuISsTC2PPc+dHuDr2K4gWNBMs?=
 =?us-ascii?Q?009ji/4TQeb1+fqlAsHjXvAubgl3GmJFrC3f0LTafHRNIFhdAO/inZbPjZMo?=
 =?us-ascii?Q?+TXmk4gT+rA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yf5UGRZi0eEeant9AviY5QwQYdqdXc0jPRUo/QjvoGfklQ1fpqCRirrB8l3X?=
 =?us-ascii?Q?12DzA/5wVG5Vuc4rA0FYNF8gC48hQYzXTBEI48SIPA1ZBrHjZHB6+1BqHojJ?=
 =?us-ascii?Q?FW8/2Cp8HsnvA73pexlP5oQWQ8T0xVaMhdDnYRYN3aeRK0jirlFbYs9w+Dbi?=
 =?us-ascii?Q?3NbtCXLVM9Lw6eZz3NUNNPsd1t9xMB2ACcknMzllJt8WAupl0n0BsM268xoO?=
 =?us-ascii?Q?F//4i9q1f2Adh8Ds87S9qnNvKqHXI+xWPqlAbgveqIJ7vQzHdxH+ogrNOGi3?=
 =?us-ascii?Q?C1D+NtFZ1NJR5H5evJpH4zkWsoyG9tbLre5+mLoeH3GEdAWy72Uf4DxWi3UG?=
 =?us-ascii?Q?EbxJg2lS8GOtRTorDqFMtG8SbTr17TkVvaubWfyG4xBAetzaJXLINkSE14tr?=
 =?us-ascii?Q?kltCHY/4Ps+SmuTg1pOR8gha7LIjqpC8WVvy1EuL7wejrA9Fm1bWxB3hVgOc?=
 =?us-ascii?Q?XHpaklanXoV37qgqDoxo0FYk2IJnRGAqiDNu2Oli7MGSVF0xwzmdq3tYt+Dl?=
 =?us-ascii?Q?rGcI70Gj/y7BOOX424czP1fothPBNA/FlAGUo87t5r684SId7xhYZQbxvjaY?=
 =?us-ascii?Q?YFWjkI/WtSv77f5IB9Nugnfk5Kz2jMCSwxJjqcwHL1+R3SkcXjNY4tel7MtS?=
 =?us-ascii?Q?If54pv4TPkSpHz7Q/WuJf/ZGZJRCbed7a8pLozIjgW5StZh+qLwIFti/kc5/?=
 =?us-ascii?Q?1J5e7QVaDY/cCOi4ICG3wQ1WT25xB02W+OyV8lf3Iq8t5c43KTy2SGIV0QjR?=
 =?us-ascii?Q?s2DcYYbhuTy7tlok647J5vf3hdFdrz3WpyFA/9FBp6FbnVWKF3uMGKyo58DC?=
 =?us-ascii?Q?jvEjUIarH9ZVtgGZu3i9dc/pGkw7+uzYafN5YS7OthWR6iAKVJXGCXf2BGRy?=
 =?us-ascii?Q?jgLnxiXvzfrsWZbWrOMBa9rpFxXiaV1xNPMOfBNcw9aLhCkUPufvPwGRUvrT?=
 =?us-ascii?Q?OZ04HEpIlquU39yLnUsbTC5cHclpn5eIwhW6PsI3p4aFoDvDK5yS/jiWjTGf?=
 =?us-ascii?Q?/6ylHezX2Nx6+Rcm+1F0N+jwJnB2qgNtx3Pyri7rWfBy0bGjKcC9AG/UsnIe?=
 =?us-ascii?Q?dZocHeG6TaOkdpUVxfSyyT3Hj/oc1BAG3vqg7SlNHtXaOn/0boi0M3fRqT0P?=
 =?us-ascii?Q?sSTZQbo9sEaLmjCxd7AVacsuPEvfFV9XFI3219SHFjTWEcWTMQR16BTxRjf9?=
 =?us-ascii?Q?/gYRDNDjikGRmujPsYe9shrTIErHluYmYzrhk4Hm/MOMWF7U5FLiIZHye5fW?=
 =?us-ascii?Q?x7IV0cV+7jO0j05FhEYUQ2Q7Kpn+OOtghbNFd9tQpDbIMDCqBZHCos0l5v4p?=
 =?us-ascii?Q?L7ceRECDeAW+SZwdWf/89ON6Gopnmp++EEZDejhNlr9fpv8QIQACIqcKxhPD?=
 =?us-ascii?Q?uTSHtPzFyKVz6UzxEj+kYBfRYjWBxYdxcfywHe8/ZW7j39H5p+H2Zjkkg6JO?=
 =?us-ascii?Q?yElvBZVvR+/2jK0YeZybWwEfTGLVqSx0TqIEfCygtixsaMFBBCHZrLji9QXj?=
 =?us-ascii?Q?r+ppmaMUDzGbHL/dlWL3BitSa82O+QfJI7r4gJd1psD7vetMxd2Ml5LRyTu5?=
 =?us-ascii?Q?jiBaIm3PP3odRQTLhpP2O16BcfOMmKCGylTVN67m?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J0vDBYUHDceKTBhk4ICwVCV6g7ZqWpCh03pNM+0cUFrcMMlIpQN35H5BKedtx0RMkt9oWA67ng0BUvNjK/7dNRTtPGcH9ERAeuXSX3iUZzkfi1Pisk78UwRJU0d3aqqnyBye/cGAAlxGU2TBRd2Sy5j27lTGupxOfvf5Nd7J1Qy4s9JXhDlS6SnHKkaK0l9OWzG+JZn4agTlxPUq1RaAvGSO4vJVGrIExmw3PGxlexGIz1Lu7zMc8Y0HypPxPVmJ+SqLpIhtfiDpvhmKPtsoWYKDtCtgOIQLYKfbOgv31DbqEpuijyoAFoR2YrYvAEkok7/1wVdiiL52jL6qE7BhzWjK43SjRQ8IRiPg6Awqf6bAISpsc6XG0KwoO810K/vEh+FC8izqRvqcFwKx3NRrcUV9HqoZYkRHYezgHo13IyMbFJ8ZgeQAmCUmbwAppjaICx4EVXBF8S3gmmoKzD0p1XuWQScfx7jE3uIZhmZ1orR4P+nQVRO+Q27JtsY1vNEtf+KVbuf+J/b3oJ+IWo0LcBBmcaRNjTEE/KqP3KierJ+YHBkiOvoTQDPl6aZv35j/esWTXr1kTNJA+Ba9/Qg+uGD+mt5+DjQ72lFUzsjCsbs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02c6798-e6f0-4ce5-06e3-08dddb811ca6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 22:22:53.6706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qcHcjabjKvR8s9ms5ttjp3VtprCwopu47MQ+aWKWX7UHSLBeuei741eSIZKtbjWHdkLO+gU+TUuTI/3Ze++Lqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8099
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-14_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508140191
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE5MiBTYWx0ZWRfXyk+gwJkqel2M
 7cZMpq8Kwkv/F/7T5grEieU0GWjFJfyFOZ1UhPhGDHzXR5JjDb2c2/1EXB6JxbEvwwQ7TYTH8bZ
 zHDjmYTDr8CaeRyO/7idaDzVxPbJ1JqcdtCNx4fbNEFoMH81LxUFCM9q0v6/H5fkHDFCao4yq5F
 /7qJWNK9AMxPly1DIumSuwUAxhzVf6OZEetyhNz6JGsetiR3HVzUrW4q4fOJPzTV4Mv5OFArcMq
 AXITcDO6MDdxXXwARWXMAfptJYA/ckeiP7kW9VLL5wWp1XiOkyKpo0TgV6cntxg8jQ0hB76IpFv
 h7WKIdmv2s9EmJ5VAt45uA32vVAPWgG52vLgDBnE6eGWvUwV+vW4W5ohUK+gwMdKfbh+o0MuHhI
 cmH/On6/zKkQNqdq63hFw0yiSHmosrvSS/wPJDPNUERvHlo0o9w18AVQSpnKs/EdEV7uZ7mq
X-Proofpoint-ORIG-GUID: 7mMvKj7NuZtAjKYQmYtBr-pfzbxbABmx
X-Authority-Analysis: v=2.4 cv=UN3dHDfy c=1 sm=1 tr=0 ts=689e61c1 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=4g-iN5A4TONiqUcboIUA:9
 a=sFP3ejIymtWaIidc:21
X-Proofpoint-GUID: 7mMvKj7NuZtAjKYQmYtBr-pfzbxbABmx

From: Ruud van der Pas <ruud.vanderpas@oracle.com>

Add six 6 more examples plus a README file with a description
of each example.  The new scripts provide a variety in
functionality and target various levels of experience.

dtrace/ChangeLog
2025-08-14  Ruud van der Pas  <ruud.vanderpas@oracle.com>

	* examples/io-cast-net.d: Show how to use wildcards.
	* examples/io-stats.d: Display I/O characteristics.
	* examples/sched-simple.d: Count on/off the CPU.
	* examples/sched-stats.d: Extensive scheduler statistics.
	* examples/thread-ids.d: Mapping of thread IDs.
	* examples/var-scope.d: Demonstrate scoping rules.
	* examples/README.md: Brief description of all examples.

Signed-off-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
---
 examples/README.md      |  71 +++++++++++
 examples/io-cast-net.d  |  70 +++++++++++
 examples/io-stats.d     | 268 ++++++++++++++++++++++++++++++++++++++++
 examples/sched-simple.d |  76 ++++++++++++
 examples/sched-stats.d  | 182 +++++++++++++++++++++++++++
 examples/thread-ids.d   | 159 ++++++++++++++++++++++++
 examples/var-scope.d    | 117 ++++++++++++++++++
 7 files changed, 943 insertions(+)
 create mode 100644 examples/README.md
 create mode 100755 examples/io-cast-net.d
 create mode 100755 examples/io-stats.d
 create mode 100755 examples/sched-simple.d
 create mode 100755 examples/sched-stats.d
 create mode 100755 examples/thread-ids.d
 create mode 100755 examples/var-scope.d

diff --git a/examples/README.md b/examples/README.md
new file mode 100644
index 000000000..19c693e92
--- /dev/null
+++ b/examples/README.md
@@ -0,0 +1,71 @@
+## Synopsis
+
+This is the README file for the examples directory that is included in the
+DTrace distribution directory.  These examples are meant to be learned
+from.  They can also be a starting point to explore changes and enhancements
+you'd like to make to these scripts.
+
+## Target audience
+
+The scripts target a wide range of users.  There are examples that are
+ideally suited for the beginners, but there also scripts that are
+probably easier to understand once you have some more practical experiences.
+To make it easier to select a script suitable for your level of experience,
+we have added a level indicator, but please do not let that withold you from
+looking at other examples.
+
+| Level | Description |
+| :---: | :----       |
+| B     | Beginner - Only some basic knowledge of DTrace is assumed. |
+| M	| Medium  - Some experience with DTrace will be helpful.     |
+| A     | Advanced - Practical experiences writing scripts is recommended. |
+
+## Installation
+
+There is no need for any additional installation instructions.  Just copy
+the script to your working directory and either use it as provided, or
+make changes as you see fit.
+
+## Usage
+
+Each script has a usage line that you can find under SYNPOSIS in the
+top part of the script.  There are also extensive additional comments.
+
+In the comments, we often refer to a target application, or command,
+but most scripts can be used for both, or also on a running process.
+For the latter you need to change the option on the dtrace command
+though.  Please check the man page for the `dtrace` command for the
+details.
+
+## The examples
+
+These are the scripts included, plus a brief description.
+
+| Script          | Description                | Level |
+| --------------- | -------------------------- | :---: |
+| fcalls.d        | List the functions executed by the target application.  |B|
+|                 | In addition to this, the number of calls to each function |
+|                 | is printed.  This information is given on a per-thread    |
+|                 | basis, as well as aggregated over all threads.            |
+| io-cast-net.d   | For the target application, show a list of all the libc |B|
+|                 | functions that include one of the selected keywords       |
+|                 | (open,close,read,write) in their name.
+| io-stats.d      | Show statistics for the fopen(), fread(), fwrite(),     |A|
+|                 | pwrite() and read() functions.  There are several probes  |
+|                 | and you are encouraged to experiment with this script.    |
+| sched-simple.d  | Use the sched provider to count how often the target    |B|
+|                 | application, or command, was scheduled on and off the     |
+|                 | CPU.  The information is given for all individual threads,|
+|                 | as well as across all the threads.                        |
+| sched-stats.d   | Display various scheduler statistics for the target     |A|
+|                 | application, or command.  For each thread, a histogram of |
+|                 | the time on the CPU is shown.  Plus global statistics,    |
+|                 | like the total time on the CPU, and the minimum and       |
+|                 | maximum.  Those threads with an on-CPU time below a user  |
+|                 | controllable limit are listed.  Also the CPU IDs and the  |
+|                 | number of times a thread was on/off CPU are given.        |
+| thread-ids.d    | For a Pthreads application, show the mapping between the|M|
+|                 | thread IDs as created by the Pthreads system and the      |
+|                 | thread ID as returned in the DTrace tid variable.         |
+| var-scope.d     | Demonstrate some of the scoping rules for global and    |B|
+|                 | clause-local variables.                                   |
diff --git a/examples/io-cast-net.d b/examples/io-cast-net.d
new file mode 100755
index 000000000..a8b336b3f
--- /dev/null
+++ b/examples/io-cast-net.d
@@ -0,0 +1,70 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  NAME
+ *    io-cast-net.d - get an overview of read and write calls
+ *
+ *  SYNOPSIS
+ *    sudo ./io-cast-net.d -c "<name-of-application> [app options]"
+ *
+ *  DESCRIPTION
+ *    This script lists all the functions in libc that include
+ *    one of the following keywords in their name:
+ *      read, write, open, close
+ *    This is a fairly wide net that is cast to find out which
+ *    libc functions are used to open, or close a file, and which
+ *    functions from libc are used to read from, or write to a
+ *    file.
+ *    The number of calls to each of these functions is counted,
+ *    plus the total of all such calls.
+ *
+ *  NOTES
+ *    - This is an example how you can find out more about a certain
+ *    area of interest.  Wildcards and empty fields in the probe
+ *    definition are ideally suited for this, but be aware not to
+ *    overask and create a huge number of probes.
+ *
+ *    - This script could be the first step to analyze the I/O
+ *    behaviour of an application, or command.  There is another
+ *    much more elaborate example to demonstrate this.
+ *
+ *    - Wildcards are used and as a result, more functions may be
+ *    listed than you might be interested in, but in this way
+ *    you will see all of them and can make a selection which
+ *    one(s) to focus on.
+ *
+ *    - There are no print statements in this example, because we
+ *    would like to show the default output from DTrace.  In
+ *    particular, the feature that, when the tracing has finished,
+ *    all aggregations are printed by default.  Since this example
+ *    only uses aggregations, it means that all results are printed
+ *    upon completion.
+ */
+
+/*
+ *  These are the probes we use to query the system and see those
+ *  function calls.  The first aggregation has a key that consists
+ *  of 2 fields: the name of the function and the module name.
+ *  Thanks to this key, the results are differentiated by the
+ *  function name and the name of the module.
+ *
+ *  The latter is always going to be libc.so, e.g. libc.so.6.  We
+ *  have included it in the key for the aggregation to show how
+ *  to make a script more flexible.  In case the module name is
+ *  left out in the probe definition, or changed, the script will
+ *  still work and print the module name(s) of the probe(s) that
+ *  fired.
+ *
+ *  The second aggregation has no key.  That means that the count
+ *  is incremented each time one of the probes fires.  That will
+ *  give us the total count across all the probes that fired.
+ */
+
+pid$target:libc.so:*read*:entry,
+pid$target:libc.so:*write*:entry,
+pid$target:libc.so:*open*:entry,
+pid$target:libc.so:*close*:entry
+{
+  @target_calls[probefunc,probemod] = count();
+  @total_count                      = count();
+}
diff --git a/examples/io-stats.d b/examples/io-stats.d
new file mode 100755
index 000000000..a9f25e405
--- /dev/null
+++ b/examples/io-stats.d
@@ -0,0 +1,268 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  NAME
+ *    io-stats.d - show several I/O related statistics
+ *
+ *  SYNOPSIS
+ *    sudo ./io-stats.d -c "<name-of-application> [app options]"
+ *
+ *  DESCRIPTION
+ *    This script shows several I/O statistics for the target
+ *    application, or command.  Among others, the filename, the
+ *    file descriptor, or stream it is connected to, the number
+ *    of bytes read, written, or both, are printed.
+ *
+ *  NOTES
+ *    - All the probes in this script are based upon the pid
+ *    provider.
+ *
+ *    - This script is quite elaborate and has several probes.
+ *    More specifically, in alphabetical order, these are the
+ *    functions from the libc library that are traced:
+ *     close(),
+ *     fclose(),
+ *     fopen(),
+ *     fread(),
+ *     fwrite()
+ *     open(),
+ *     pwrite(),
+ *     read(),
+ *    In the probes, we rely on the information from the man pages
+ *    for these functions to identify arguments of interest and
+ *    the return values.
+ *
+ *    - Not all of the probes may be relevant to your case.  While
+ *    no harm is done if a probe does not fire, the associated
+ *    aggregation(s) will be empty, but still printed.  You can of
+ *    course always remove such probes and related print statements.
+ *
+ *    - It may also be that some functions that you're interested
+ *    in are missing.  If so, probably an existing probe can be
+ *    used as a basis to add one or more new probes.
+ *
+ *    - A related script is io-cast-net.d.  You may want to run
+ *    this first to cast a fairly wide net and explore which open,
+ *    close, read and write functions are called when executing the
+ *    target.
+ *
+ *    - All print statements are in the END probe.  On purpose
+ *    several different format strings are used.  This is done to
+ *    demonstrate the flexibility in presenting the results.
+ */
+
+/*
+ *  Suppress the default output from the dtrace command and
+ *  have printa() print the data sorted by the first field.
+ */
+#pragma D option quiet
+#pragma D option aggsortkey=1
+#pragma D option aggsortkeypos=0
+
+/*
+ *  Capture the name of the file that needs to be opened in the call
+ *  to any function that starts with fopen.  The first argument to
+ *  this function contains the name of the file to be opened.
+ *  As arg0 is of type integer, it is converted to a string and
+ *  stored in the thread-local variable fname_fopen.
+ */
+pid$target:libc.so:fopen*:entry
+{
+  self->fname_fopen = copyinstr(arg0);
+}
+
+/*
+ *  This probe is nearly identical to the one above, but note that
+ *  for this probe, the name of the thread-local variable is slightly
+ *  different and called fname_open.
+ */
+pid$target:libc.so:open:entry
+{
+  self->fname_open = copyinstr(arg0);
+}
+
+/*
+ *  This is the return probe for any of the fopen calls.  The
+ *  predicate ensures that fname_fopen has been set and if so,
+ *  the probe updates the count and stores this in an aggregation
+ *  with 3 fields: the name of the function, the name of the
+ *  file and the return value of the function, which is stored
+ *  in arg1.
+ *  Note that we can indeed access this file name.  Although
+ *  set in the corresponding entry probe, a thread-local
+ *  variable is accessible in the data space of the thread
+ *  and so can be read, or written, here.
+ *  The third field in the aggregation is arg1.  This is
+ *  the return value of the function and is the pointer to the
+ *  stream.
+ *  Since we no longer need variable fname_fopen it is released.
+ */
+pid$target:libc.so:fopen*:return
+/ self->fname_fopen != 0/
+{
+  @file_pointer[probefunc,self->fname_fopen,arg1] = count();
+  self->fname_fopen = 0;
+}
+
+/*
+ *  This probe is nearly identical to the previous probe.
+ *  Other than the name of the thread-local variable, the
+ *  difference is in the name of the aggregation.  This is
+ *  because the return value, which is the file descriptor, is of
+ *  type integer.  This means that we need a different format
+ *  string *  when printing this field.
+ */
+pid$target:libc.so:open:return
+/ self->fname_open != 0/
+{
+  @file_descriptor[probefunc,self->fname_open,arg1] = count();
+  self->fname_open = 0;
+}
+
+/*
+ *  This probe stores the name of the function, which is fclose,
+ *  and the argument, the pointer to the stream.
+ */
+pid$target:libc.so:fclose:entry
+{
+  @fclose_stream[probefunc,arg0] = count();
+}
+
+/*
+ *  This probe is very similar to the one above.  Again, the
+ *  difference is in the name of the aggregation, and the argument
+ *  which is the file descriptor and of type integer.
+ */
+pid$target:libc.so:close:entry
+{
+  @close_fd[probefunc,arg0] = count();
+}
+
+/*
+ *  One of the functions traced, is pwrite().  The first
+ *  argument, arg0, is the file descriptor.  The third
+ *  argument is arg2.  This contains the number of bytes
+ *  written.
+ *  The aggregation function sum() is used to sum up all
+ *  those byte counts, and as a result, the aggregation contains
+ *  the total number of bytes written to the file connected
+ *  to the file descriptor.
+ */
+pid$target:libc.so:pwrite:entry
+{
+  @pwrite_bytes[probefunc,arg0] = sum(arg2);
+}
+
+/*
+ *  The pwrite() function returns the number of bytes written.
+ *  This value is added to the existing contents of the
+ *  aggregation.  The name of the function, pwrite, is the only
+ *  field in the key, so this aggregation contains the total
+ *  number of bytes written by pwrite().
+ */
+pid$target:libc.so:pwrite:return
+{
+  @pwrite_total_bytes[probefunc] = sum(arg1);
+}
+
+/*
+ *  This probe accumulates the number of bytes the read() function
+ *  requests to be read.  The aggregation is differentiated by the
+ *  file descriptor.  This means that we get the totals on a per
+ *  file descriptor basis.
+ *  We also store the file descriptor in a thread-local variable
+ *  called fd, because we would like to use it in the return probe
+ *  for this function.
+ */
+pid$target:libc.so:read:entry
+{
+  self->fd = arg0;
+  @bytes_requested[probefunc,self->fd] = sum(arg2);
+}
+
+/*
+ *  This is where things come together.  The read() function returns
+ *  the actual number of bytes read.  These values are accumulated in
+ *  an aggregation that includes the file descriptor in the key.  In
+ *  this way we can print both the number of bytes requested and the
+ *  actual number of bytes read.
+ *  We also accumulate the total number of bytes actually read across
+ *  all the file descriptors.
+ *  Since thread-local variable fd is no longer needed, the storage is
+ *  released.
+ */
+pid$target:libc.so:read:return
+{
+  @bytes_actually_read[probefunc,self->fd] = sum(arg1);
+  @total_bytes_read                        = sum(arg1);
+  self->fd = 0;
+}
+
+/*
+ *  This is a shared clause for the probes for the fread() and
+ *  fwrite() functions.  We can share the clause, because the
+ *  arguments and return value are the same for both functions.
+ *  The clause-local variable comment is used to store a dynamically
+ *  generated string.  This string is then concatenated with the
+ *  name of the function, resulting in a string that depends on the
+ *  function name in the probe.
+ *  The aggregation has a key that consists of the pointer to the
+ *  stream and the generated string.  This aggregation accumulates
+ *  the product of the byte size and the number of elements, which
+ *  is the total number of bytes read, or written.
+ */
+pid$target:libc.so:fread:entry,
+pid$target:libc.so:fwrite:entry
+{
+  this->comment = (probefunc == "fread") ?
+                   "read by " : "written by ";
+  this->rw = strjoin(this->comment,probefunc);
+  @total_byte_count_frw[arg3,this->rw] = sum(arg1*arg2);
+}
+
+/*
+ *  This probe accumulates the return value of the fread() function,
+ *  which is the number of elements read.  This number is accumulated
+ *  across all pointers to streams.
+ */
+pid$target:libc.so:fread:return
+{
+  @fread_total_elements[probefunc] = sum(arg1);
+}
+
+/*
+ *  The output section where all the results are printed.  Note that
+ *  in one case, we use 2 aggregations in the call to printa().
+ *  This is supported if the key is the same.
+ */
+END
+{
+  printf("%8s %20s   %-15s %6s\n",
+               "Function","Filename","File pointer","Count");
+  printa("%8s %20s   0x%-13p %@6d\n",@file_pointer);
+
+  printf("\n%8s %20s   %-15s %6s\n",
+               "Function","Filename","File descriptor","Count");
+  printa("%8s %20s   %-15d %@6d\n",@file_descriptor);
+
+  printf("\n%8s   %-16s %7s\n","Function","Stream/FD","Count");
+  printa("%8s   0x%-14p %@7d\n",@fclose_stream);
+  printa("%8s   %-16d %@7d\n",@close_fd);
+
+  printf("\n");
+  printf("%8s %5s %14s\n","Function","FD","Bytes written");
+  printa("%8s %5d %@14d\n",@pwrite_bytes);
+  printa("Total bytes written by %s: %@ld\n",@pwrite_total_bytes);
+
+  printa("\nOn stream %p - Total bytes %s = %@ld\n",
+                                  @total_byte_count_frw);
+
+  printa("Total elements read by %s = %@ld\n",
+                                  @fread_total_elements);
+
+  printf("\n%33s\n","Bytes read");
+  printf("%8s %6s %10s %10s\n","Function","FD","Requested","Actual");
+  printa("%8s %6d %@10d %@10d\n",@bytes_requested,
+                                 @bytes_actually_read);
+  printa("\nTotal number of bytes read: %@d\n",@total_bytes_read);
+}
diff --git a/examples/sched-simple.d b/examples/sched-simple.d
new file mode 100755
index 000000000..6f93a5d50
--- /dev/null
+++ b/examples/sched-simple.d
@@ -0,0 +1,76 @@
+#!/usr/sbin/dtrace -s
+/*
+ *  NAME
+ *    sched-simple.d - count how often the target was on/off the CPU
+ *
+ *  SYNOPSIS
+ *    sudo ./sched-simple.d -c <target>
+ *
+ *  DESCRIPTION
+ *    This script uses the sched provider to count how often the
+ *    target proces was scheduled on and off the CPU.  The target
+ *    can be an application, or any command.
+ *    The information is given for all individual threads used by
+ *    the target, as well as across all the threads.
+ *
+ *  NOTES
+ *    There are 2 aggregations.  The one with 2 fields in the
+ *    key, thr_count_states, uses the thread ID as the first field.
+ *    By configuring printa() through pragmas to print the data
+ *    sorted by the first field, the results for this aggregation
+ *    are shown on a per thread basis.
+ */
+
+/*
+ *  Suppress the default output from the dtrace command and
+ *  have printa() print the data sorted by the first field.
+ */
+#pragma D option quiet
+#pragma D option aggsortkey=1
+#pragma D option aggsortkeypos=0
+
+/*
+ *  These are 2 probes from the sched provider that share a
+ *  clause.  Without a predicate, these probes will fire as
+ *  soon as any process goes on/off the CPU.  That will work
+ *  fine, but in this case we use a predicate to restrict the
+ *  probing to the target application, or command.
+ *
+ *  The clause-local variable state is thread safe.  It is used
+ *  to demonstrate how to construct a string to be used as a field
+ *  in an aggregation, or for any other purpose.
+ *
+ *  We know that the probe name is either on-cpu or off-cpu.  This
+ *  is used to assign a different string to variable state.
+ *
+ *  The 2 aggregations are used to count how often the probes fired.
+ *  The difference is in the key.  The first aggregation,
+ *  count_states, does not use the thread ID in the key.  It counts
+ *  across all threads.  In contrast with this, the second
+ *  aggregation, thr_count_states, differentiates the counts by the
+ *  thread ID.
+ */
+sched:::on-cpu,
+sched:::off-cpu
+/ pid == $target /
+{
+  this->state = (probename == "on-cpu") ?
+                  "scheduled on" : "taken off";
+  @count_states[this->state]         = count();
+  @thr_count_states[tid,this->state] = count();
+}
+
+/*
+ *  Print the results.  We use printf() to print a header.
+ *  For both aggregations, a formatted printa() statement
+ *  is used.  The printf() in between the 2 printa()
+ *  statements is used to separate the 2 blocks with results.
+ */
+END
+{
+  printf("%8s %-20s %6s\n","TID","State","Count");
+  printf("====================================\n");
+  printa("%8d %-12s the CPU %@6d\n",@thr_count_states);
+  printf("\n");
+  printa("Total count %12s: %@d\n",@count_states);
+}
diff --git a/examples/sched-stats.d b/examples/sched-stats.d
new file mode 100755
index 000000000..50b3b263a
--- /dev/null
+++ b/examples/sched-stats.d
@@ -0,0 +1,182 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  NAME
+ *    sched-stats.d - display various scheduler statistics
+ *
+ *  SYNOPSIS
+ *    sudo ./sched-stats.d -c "<name-of-app [app options]" <threshold>
+ *
+ *  DESCRIPTION
+ *    This script shows several thread-scheduling statistics that
+ *    were collected while the target application, or command, was
+ *    running.
+ *
+ *    For good performance, a thread should run on the same CPU,
+ *    or at least in the same NUMA node for as long as possible.
+ *    In case it is taken off the CPU, it should be scheduled
+ *    back on the same CPU, or at least in the same NUMA node.
+ *
+ *    The information printed shows the scheduling decisions
+ *    for any (multithreaded) application:
+ *
+ *    - For each thread, a histogram of the on-cpu times is shown.
+ *
+ *    - This is followed by a table with the overall timing
+ *    statistics.  For each thread, the total on-cpu time is
+ *    given, plus the minimum and maximum on-cpu time.
+ *
+ *    - The script takes one parameter.  This is a threshold
+ *    value.  It is a lower limit on the on-cpu times.  For each
+ *    thread it is reported how often the on-cpu time was at, or
+ *    below, this value.
+ *    This table might point at threads that are falling behind
+ *    on a (heavily loaded) system
+ *
+ *    - The last 2 tables give information on the thread affinity.
+ *    The first table of these 2 is sorted by thread ID and
+ *    shows the CPU(s) used by each thread, as well how often
+ *    the thread was scheduled on the CPU, and taken off again.
+ *    The second table of these 2 shows the same information,
+ *    but now from a CPU centric view.
+ *
+ *  NOTES
+ *    This script works with any target application or command.
+ */
+
+/*
+ *  Suppress the default output from the dtrace command and
+ *  have printa() print the data sorted by the first field.
+ */
+
+#pragma D option quiet
+#pragma D option aggsortkey=1
+#pragma D option aggsortkeypos=0
+
+/*
+ *  Read the threshold value from the command line and store it in
+ *  a global variable.  By using a global variable, all probes can
+ *  read/write it.  In this case it is used as a read-only variable.
+ */
+BEGIN
+{
+  time_threshold = $1;
+}
+
+/*
+ *  An on-cpu probe with a predicate to ensure that the probe only
+ *  fires when the target is scheduled on the CPU.
+ *
+ *  Set the base value of the timer.  Since each thread needs
+ *  to have its own timer, we use a thread-local variable.
+ *
+ *  There are 2 aggregations.  Both increment their counter each
+ *  time that this probe fires.  The thread ID (in tid) and CPU ID
+ *  (in curcpu->cpu_id) are used to define the key.
+ *
+ *  The difference between the 2 aggregations is that the fields in
+ *  the key have been swapped.  Given that printa() has been
+ *  configured to sort the data by the first column, the first
+ *  aggregation shows a thread centric view, while the second one
+ *  has a CPU ID centric view.
+ */
+sched:::on-cpu
+/ pid == $target /
+{
+  self->ts_start = timestamp;
+
+  @thr_cpu_id_on_cpu[tid,curcpu->cpu_id] = count();
+  @cpu_id_thr_on_cpu[curcpu->cpu_id,tid] = count();
+}
+
+/*
+ *  This is the first of 2 probes using off-cpu.  In this probe,
+ *  again a predicate is used to restrict the data to the target
+ *  command.
+ *
+ *  Since the process/thread is about to go off CPU, now is the time
+ *  to record how long the thread has been running on the CPU.
+ *  The value is converted to microseconds (us) and stored in a
+ *  clause-local variable.
+ *
+ *  This variable is then used to update 4 aggregations: the
+ *  histogram of the on-CPU times, the total on CPU time, plus the
+ *  minimum and maximum time on the CPU.
+ *
+ *  The next 2 aggregations are very similar to those used in the
+ *  on-cpu probe.
+ *
+ *  Last, but not least, the storage for the thread-local variable
+ *  is released, because it is no longer needed.
+ */
+sched:::off-cpu
+/ pid == $target /
+{
+  this->time_on_cpu = (timestamp - self->ts_start)/1000;
+
+  @timings[tid]    = quantize(this->time_on_cpu);
+  @total_time[tid] = sum(this->time_on_cpu);
+  @min_time[tid]   = min(this->time_on_cpu);
+  @max_time[tid]   = max(this->time_on_cpu);
+
+  @thr_cpu_id_off_cpu[tid,curcpu->cpu_id] = count();
+  @cpu_id_thr_off_cpu[curcpu->cpu_id,tid] = count();
+
+  self->ts_start = 0;
+}
+
+/*
+ *  This is the second off-cpu probe.  It has a different and
+ *  somewhat more complicated predicate.
+ *  This probe fires for the target command, but only in case the
+ *  time on the CPU is below the user controllable threshold value.
+ *  We basically record and count the event, but of course any
+ *  other action can be taken here.
+ *  An aggregation is used to store the data.  The thread ID (tid)
+ *  is used as a key and we increment the counter.  This produces
+ *  a count for each thread.
+ */
+sched:::off-cpu
+/ pid == $target && this->time_on_cpu <= time_threshold /
+{
+  @thr_below[tid] = count();
+}
+
+/*
+ *  This is where all results are printed.  It is all quite
+ *  straightforward, but note that in three cases, multiple
+ *  aggregations are printed with a single printa().  As long as the
+ *  keys are the same, this is supported and makes it possible to
+ *  print multiple columns with values.
+ */
+END
+{
+  printf("Thread times on the CPU (us)\n");
+  printa(@timings);
+
+  printf("\n=====================================\n");
+  printf("%10s %26s\n","TID", "Times on the CPU (us)");
+  printf("%21s %6s %8s\n","Total","Min","Max");
+  printf("=====================================\n");
+  printa("%10d %@10d %@6d %@8d\n",@total_time,@min_time,@max_time);
+
+  printf("\n=====================================\n");
+  printf("Thread ON CPU time threshold: %d us\n",time_threshold);
+  printf("=====================================\n");
+  printf("%8s %26s\n","TID","Count below threshold");
+  printa("%8d %@14d\n",@thr_below);
+
+  printf("\n=====================================\n");
+  printf("%10s  %8s %11s\n","TID","CPU ID","Count");
+  printf("%37s\n","On CPU  Off CPU");
+  printf("=====================================\n");
+  printa("%10d  %8d %@7d %@8d\n",@thr_cpu_id_on_cpu,
+                                 @thr_cpu_id_off_cpu);
+
+  printf("\n=====================================\n");
+  printf("%8s  %10s %11s\n","CPU ID","TID","Count");
+  printf("%37s\n","On CPU  Off CPU");
+  printf("=====================================\n");
+  printa("%8d  %10d %@7d %@8d\n",@cpu_id_thr_on_cpu,
+                                 @cpu_id_thr_off_cpu);
+}
diff --git a/examples/thread-ids.d b/examples/thread-ids.d
new file mode 100755
index 000000000..38210c4d6
--- /dev/null
+++ b/examples/thread-ids.d
@@ -0,0 +1,159 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  NAME
+ *    thread-ids.d - show the mapping between Pthread IDs and tid values
+ *
+ *  SYNOPSIS
+ *    sudo ./thread-ids.d -c "<name-of-application> [app options]"
+ *
+ *  DESCRIPTION
+ *    This script assumes that the target uses the Pthreads library
+ *    to create one or more threads.  It shows the mapping of the
+ *    Pthread thread IDs and the thread ID, as returned in the tid
+ *    built-in variable.
+ *
+ *  NOTES
+ *    - In addition to showing how to uncover this mapping, this
+ *    script also shows a technique how to retrieve a value from
+ *    a pointer argument in a function call.
+ *
+ *    In this case, this is the thread ID that pthread_create()
+ *    returns in its first argument.
+ *
+ *    This is from the man page for pthread_create():
+ *
+ *    int pthread_create(pthread_t *restrict thread,
+ *                        const pthread_attr_t *restrict attr,
+ *                        void *(*start_routine)(void *),
+ *                        void *restrict arg);
+ *
+ *    We need to capture the contents of *thread.
+ *
+ *    In this case, we cannot use the built-in tid variable
+ *    within pthread_create(), because typically, this function
+ *    is executed by one thread, the main thread.  This means
+ *    that the value in tid is the thread ID of this main thread,
+ *    but we need to have the value of the thread that is created
+ *    as a result of calling pthread_create().  As shown below,
+ *    this can be done by tracing clone3, which is called by
+ *    pthread_create().
+
+ *    - It is assumed that a function called main is executed.
+ *    If this is not the case, this is not a critical error.
+ *    The first probe is used to capture the tid value for the main
+ *    program.  This thread is however not created by function
+ *    pthread_create() and therefore this part of the script is
+ *    not essential.
+ *    This is why this probe and printf statement in the END probe
+ *    can safely be removed, or replaced by a suitable alternative.
+ */
+
+/*
+ *  Suppress the default output from the dtrace command.
+ */
+#pragma D option quiet
+
+/*
+ *  Declare a global variable.  This is to ensure that the compiler
+ *  sees it before it is referenced.
+ */
+self int clone_tid;
+
+/*
+ *  Store the thread ID of the main thread.
+ */
+pid$target:a.out:main:entry
+{
+  tid_main = tid;
+}
+
+/*
+ *  Two thread-local variables are set here.  The first one is used
+ *  in a predicate on the second probe to ensure that we are only
+ *  tracing the clone* calls executed while within pthread_create().
+ *
+ *  We actually know that clone3 is called.  By using the wildcard
+ *  here, the script still works should this number change in the
+ *  future.
+ *
+ *  Variable pthr_id_p captures the first argument of the call to
+ *  pthread_create().  This is a pointer, but we can't dereference
+ *  it here, because the contents this pointer points to, is only
+ *  available upon return.
+ *  The way this is solved, is by storing the pointer in this probe.
+ *  In the return probe for this function, we can then dereference
+ *  the pointer.
+ */
+pid$target:libc.so:pthread_create:entry
+{
+  self->in_pthr_create = 1;
+  self->pthr_id_p = (int64_t *) arg0;
+}
+
+/*
+ *  We know that one of the clone functions is called from within
+ *  pthread_create() and it returns the thread ID that DTrace stores
+ *  in the tid variable.
+ *  This is why the return value, which is stored in arg1, is copied
+ *  into a thread-local variable called clone_tid.  This variable is
+ *  then referenced in the return probe for pthread_create().
+ */
+pid$target:libc.so:clone*:return
+/ self->in_pthr_create == 1 /
+{
+  self->clone_tid = arg1;
+}
+
+/*
+ *  This is where things come together.
+ *
+ *  We already have the value for the thread ID as used by DTrace.
+ *  It is stored in thread-local variable clone_tid.
+ *
+ *  Now we can capture the Pthreads thread ID.
+ *
+ *  We are about to return from pthread_create() and can dereference
+ *  the pointer.
+ *  Before we do so, the data needs to be copied from userland
+ *  into the kernel.  Since this is an address, 8 bytes are copied.
+ *  The value is what pthread_create() returns in its *thread
+ *  first argument, which is the Pthreads thread ID.
+ *  This gives us both thread IDs and they are used in the key
+ *  for aggregation @thread_mapping.
+ *
+ *  There is one more thing to this though.  It is not strictly
+ *  necessary to use an aggregation.  An associative array can
+ *  be used, but that is going to be a problem when it comes
+ *  to printing the results.  There is no printa() equivalent
+ *  for associative arrays, but since we do not know the key(s)
+ *  upfront, we don't know what to print.
+ *  Instead, we use an aggregation, but do not print the result.
+ *
+ *  Last, but not least, at this point we can and should return
+ *  the storage for the thread-local variables.
+ */
+pid$target:libc.so:pthread_create:return
+{
+  this->pthr_id = *(int64_t *) copyin(*self->pthr_id_p,8);
+  @thread_mapping[this->pthr_id,self->clone_tid] = count();
+
+  self->pthr_id_p      = 0;
+  self->clone_tid      = 0;
+  self->in_pthr_create = 0;
+}
+
+/*
+ *  The aggregation is printed in the END probe.  We use printf()
+ *  statements to print the thread ID of the main program and the
+ *  table header.
+ *  Note that there is no format field for the value for the
+ *  aggregation.  As explained above, the value is not relevant
+ *  in this case.
+ */
+END
+{
+  printf("Thread ID of main program: %d\n\n",tid_main);
+  printf("%16s <=> %-9s\n\n","Pthreads ID","Thread ID");
+  printa("%16d <=> %-9d\n",@thread_mapping);
+}
diff --git a/examples/var-scope.d b/examples/var-scope.d
new file mode 100755
index 000000000..b5317afd2
--- /dev/null
+++ b/examples/var-scope.d
@@ -0,0 +1,117 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  NAME
+ *    var-scope.d - initialize, update and print variables
+ *
+ *  SYNOPSIS
+ *    sudo ./var-scope.d -c <target>
+ *
+ *  DESCRIPTION
+ *    This script demonstrates some of the scoping rules.  It
+ *    shows the behaviour of global and clause-local variables.
+ *
+ *  NOTES
+ *    Other than the BEGIN and END probe used here, there are
+ *    2 more probes for the fopen() function, but you can use any
+ *    probe you like, or no additional probes at all.  You are
+ *    encouraged to experiment with this example and make changes.
+ *
+ *    In case this example is used with the date command, you will
+ *    see something like this:
+ *
+ *    $ sudo ./var-scope.d -c date
+ *    In BEGIN
+ *        var_A = 10 var_B = 20
+ *        this->C = 60
+ *    In fopen - return
+ *        var_A = 11 var_B = 21
+ *    <output from the date command>
+ *    In END
+ *        var_A = 11 var_B = 21
+ *    $
+ *
+ *    Below, the workings of each probe is explained.  Since the
+ *    results depend on the command that is traced, we base the
+ *    explanations on the output from the above example.
+ */
+
+/*
+ *  Suppress the default output from the dtrace command.
+ */
+#pragma D option quiet
+
+/*
+ *  This demonstrates how to declare a variable outside of a clause.
+ *  Variable var_B is declared to be of type int64_t.  This is a
+ *  global variable.  It is initialized to zero by default.
+ */
+int64_t var_B;
+
+/*
+ *  In this clause for the BEGIN probe, var_A is initialized to 10
+ *  and var_B is given a value of 20.  Both are global variables.
+ *  Variable C is a clause-local variable initialized to 30.
+ */
+BEGIN
+{
+  var_A = 10;
+  var_B = 20;
+  this->C = 30;
+}
+
+/*
+ *  In this clause for the BEGIN probe, clause-local variable C is
+ *  updated to a value of 60.  This demonstrates that clause-local
+ *  variables are local to the set of clauses executed for a
+ *  particular probe firing.  This set is executed in lexical order.
+ *  Here, there are 2 sets for the BEGIN probe.
+ *  The printed values in the example above confirm this update
+ *  for C, as well as the initial values for var_A and var_B.
+ */
+BEGIN
+{
+  this->C += 30;
+  printf("In %s\n",probename);
+  printf("\tvar_A = %d var_B = %d\n",var_A,var_B);
+  printf("\tthis->C = %d\n",this->C);
+}
+
+/*
+ *  The clause in this probe updates var_A.  Since this is a global
+ *  variable, this change is visible to all probes that fire after
+ *  this probe has fired.
+ */
+pid$target::fopen:entry
+{
+  var_A += 1;
+}
+
+/*
+ *  The clause in this probe updates var_B and prints both var_A
+ *  and var_B.  The probefunc (fopen) and probename (return) are
+ *  printed first, followed by the values for var_A and var_B.
+ *  We are in the return probe here, so we know that the entry
+ *  probe has fired too.  This means that var_A has been updated
+ *  as well.
+ *  This is exactly what we see in the output above: var_A is 11
+ *  and var_B is 21, as it has just been updated.
+ *  Note that C is not visible here, because it is local to the
+ *  BEGIN probe.
+ */
+pid$target::fopen:return
+{
+  var_B += 1;
+  printf("In %s - %s\n",probefunc,probename);
+  printf("\tvar_A = %d var_B = %d\n",var_A,var_B);
+}
+
+/*
+ *  Both var_A and var_B are global variables and are visible
+ *  in the END probe.  The final values are printed here.
+ */
+END
+{
+  printf("In %s\n",probename);
+  printf("\tvar_A = %d var_B = %d\n",var_A,var_B);
+}
-- 
2.47.3

