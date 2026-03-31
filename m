Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6928040DFBD
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774918965; cv=fail; b=J8+oHFN8vOSeJU3sqXONfeMtHH+KvQ7hkgIMEAWEBucr+63VEpb+4vJGeYW6a4pn/WcmC0QLASCcHNEWgBUPkrxgTWVqMXS6qKVX1oh5PAJgQodG1H8uo9GrdjczoThogN0SjiVwRQjodWLGjI35/7AA/Z6qnxGowkOAOmpiGl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774918965; c=relaxed/simple;
	bh=Vxkl9ODTdPGRdPfyvETD2TBpSs6yAtieoQCa6QFZgqQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rgqv+ondmtqleLPe6scNt01WKljpC7mr6qb/lWV9aK1XzOteiBTx8G139nSUG7vfbcSNVmQr9tzYD/Lq+C9slfkmPxm3kW0JzVMWeA0IFyrY9Jkev6a+n1LGw06yVgCYQujb8wGApewKE+A1Lag/OwK6RbSwASqbm8EaLFDYTps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dJn6fvou; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gLsv5NFJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dJn6fvou";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gLsv5NFJ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UM9dfr871466
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=jOynJUs/9kUf099Yu8
	kFG3IRUFd8EYlgFWWONHOCBlU=; b=dJn6fvou0dXdXJba1VHL/1dwUv8iZ0BkFA
	jdhb5F9qB7yg9SgLlz2LaEiUABSxKYVuTHH51uqQiWQWsfJ3ErC/xKEeLxtCkZK5
	Fdtc5oZordazDoKsEhxF4VLnPi6FLMB5xT4TU69ISN/nJZiv5YEIdabAJjG8n/lb
	2i0Dn3NeTqJgdSDiexw1WXLJHxBuUkx5fenHdRtj605aiRjoEwJN31laiixgPlgc
	LLoPTqUtX/4ZQbmUYdPV4VodjEOIXLwhUvEU9lovG0BRH54URETh3njTqUGy8WWc
	zC12PCoqunt0+pXMHBFisFI93weQSnJoVhk+Brvrqut9Zu45s2hg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d671au91v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62UNPMue022296
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:41 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012060.outbound.protection.outlook.com [52.101.48.60])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4d65efj75c-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qF98WjNITk79oJzBPYg2N9o499ix9GmSdEqRZUyBfeQDCeSNUUs0Xay9CfM709GXEebX3itRoTVpenoePdQG0XJCrM1A4PmD8L4M4wfsORNCsrWDHx/mTXsVRQmuFTShV7wDV6i9jgbOUxEA5EZsF64P9aXlYhEfH7nleKTXRVrfLnbe9RVJ/MfJV2BtVnSWJoWdBL/iivPdWx1KJJcqTqYPu7RZOEo6fQgLtN3qW7fiWTBIIh5oqPSiM6/IjAVBZnn3Lm3dRK1Ychu/mPGjARJ6edYisJZ8Blls6nHCSYurvFQJsISW0eqLDpKHfKOGPW4L28UcxID+12/k9+WTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOynJUs/9kUf099Yu8kFG3IRUFd8EYlgFWWONHOCBlU=;
 b=U/os0JLWFph0CEggGSpCMWjd/ZjimNscVyJi33XCTYNigYfQ7OViMOY8+RM9rZpOl+wDSC5oSSBdYy5ItkZHVYE5m1oZvGNNNUFsiTk2l/umR2eThwp3NKcrS/JweFa5pzwOM6AwHhrhZiiJqmtHOZ2bqttQCAykjyvxRHILT5u4E10mXu2EnmHWssBfq27yfQ+PfuXGlvxTBTES2BAjarCfCsOeY5qCn69l2uouctFmYQijlUPr+5gk96PgFMz7nblLLiGSAtfFL9srpacikuxhUuXMBln71V5FwCD0fzDEsRMX1d6eyMejF/huyAkA7mVeUWT/Z56u8TYn3+PCMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOynJUs/9kUf099Yu8kFG3IRUFd8EYlgFWWONHOCBlU=;
 b=gLsv5NFJaOU8eZOXXXktCWzvayIe+b4+DI7RMfUkPc855syAgP4zx2YgcczTuhI5Vi2aNAxLFasahcX6h73NAtxb73NZ1aYDnvORauFOGf1KKI9f6kUaa2DGJPP3xhZdb1LuYkwn1B20PpYIswpFiEE1xI/zkgT0AtnT7FhcoNM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6130.namprd10.prod.outlook.com (2603:10b6:510:1f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:02:36 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:02:36 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 6/6] test: Check declaration (without init) inside a probe
Date: Mon, 30 Mar 2026 21:02:24 -0400
Message-Id: <20260331010224.16165-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20260331010224.16165-1-eugene.loh@oracle.com>
References: <20260331010224.16165-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0062.namprd08.prod.outlook.com
 (2603:10b6:a03:117::39) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 06b5dec2-188f-487a-6b15-08de8ec1328c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4Q5obruK5BRqgetHpa5x45ObMdaa5k8/igRulPr9INt3D4I3tM50J46FbsQN8jNaDzObOuWScOqI3ku895Cr+7kepPzfFu3Eq+ExLglxtXAdN/tHd/gXkEYUMYSZfngwhxoH9TR2TcSktqlEdyM3yV64eOMzh9RZYKRgD9szwUBBO85Y/WcdhjnyQAiqfiTfZqpT9EAzOT/Orzj0XaRdTZITvZW556PwEQt+Pht76CWCb+mvbfCbWLzVvdmiSZQNJxmQP0ns8OyY8BrqZ4ViSrw7fhm1xe+oNMfph4zgBQxoWNMbqrKZNMQx2j8rpdARCNY688i8y/aqeoJFLjhKsK9yJT85cau/bx6FSLhjVF0WIMnHA9ZgXGZDwwejyNef+rQn492dRaFTAUVFFsN8Xx13EHhBHEkXo1Rx+QBXGt2tG8hsAeSIfwYX6KJJRanR6UbxEafdwpvYQIM8AVM53Fg8+d96BysmXc85Zgb2KYfdX7bbtfA0pIuU5AoYGiIzNd359NkK7Z8+grhDR8oHNCZKLCYWUuPgFox9Gmwg9bMNOK/SczYdYEJtFL1crx32HjvRnEgDttsD3W+aYr55BLT4QArU56rf2f7vVbUESwa2vx4ZKRSuyp3fZxBXQq2r58GDLi0Z7FclqZW7ncCdq+9LzgdbQJyWuGPqjq1mSAKOUbLAQnhrn3bqqrUIGCh+ZTcYbQgw3g1zAH02O3tQeL3ozEjjz2dC/WY9/I4usKCMHOPQvW24ex4tIQ9+Vi/F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mJB7ww+epwiAauOtQAe0hs5DdyIK56P19OQ6OliGOKzJQyW7Qqy7VFylpEUl?=
 =?us-ascii?Q?YI5HRW7Uq9lNY4NM+5misbS6ohMPFEbtE0T8HMFXCXjGcRr26B9q+a6QZbuY?=
 =?us-ascii?Q?n1ecv05oeYoEUkUV4NHKgUDwG0ZUB11P8ZddMuEmxEwSCpTxMzdw9LjcDUWi?=
 =?us-ascii?Q?dgcq26lod9QlwLq70y4Im9X9u1Ko/DEDVAw7Ri7KEYem0M0DxMzOsBpLs0lv?=
 =?us-ascii?Q?1bxu1c6k6O9MN6gHmSZHBSJAV3Mwohgy09OPF6v+5iVtVqRI7iYksos8w5Yn?=
 =?us-ascii?Q?JNOzIp3vV5oBOBxJ1PYLQgFNZSms957lg+i0yGUxF7AAFwC4PRJamSFPjTw6?=
 =?us-ascii?Q?90OaUdqpPs4nUxE+99c7OCz1CoZx3YI3coIzMrPXB0nN8bHGCqDveVfd+5pY?=
 =?us-ascii?Q?xzQtVrg4E6ov2Bes28WFJ9FavpK08sFHIUV11qxAF+LCaQBTFw6RSGmhX+Br?=
 =?us-ascii?Q?Pi231gO7QWzVxcOhdPNhWkpcjB3uF2zos3Z7FUoer0U75GcDuFFSSbkITyrx?=
 =?us-ascii?Q?a6gCw6MDQlBqHHpIjCxy6rigQc5nBDbIA2ab0d5rXloDNiM8UhMCTx659UZJ?=
 =?us-ascii?Q?1nAPnRF/cGXj83b3trTDs9UoMRQB3H9YjhuAgLlc7X5fLVXd4XawObkrej96?=
 =?us-ascii?Q?Cb6wM6kPyMC8b+Wlr04q1OXyB9D691IUBtxDXRuHjMVHQJ2W2mc8Hpku9QB7?=
 =?us-ascii?Q?iMGYD77ZyyQAUJ6aoQaOw0RnipoQ+fjGxE1brs1PJ4gBEmLwulwmicYjOD9H?=
 =?us-ascii?Q?FafWMU1cZt2YEn8yK8yESap56ZqiqTQNw/1e2+hxPIAKgLSOsOc27BUEmucK?=
 =?us-ascii?Q?AwS8AUUelZm/FpTqXV66UfM1Vg5vHF7VXv1K22ZozA//yvlYEexWRw8Zrp6D?=
 =?us-ascii?Q?/LoIzHPnEqNuxniJCblDkx+w5an+snw1R8sEne4/el/7EuVln074M9Q7pHMh?=
 =?us-ascii?Q?qookaxoQKY9C7D9gq9XAe5j2VRRmXuWwt6QbpfzeCx6Htnwj1kn+mS2Ki33N?=
 =?us-ascii?Q?D5jOF5nBwIDDEcLKHDEwAxFeoiW1TmPlIMkZRdqawCYH8amqVI2iw5DsIs2X?=
 =?us-ascii?Q?DIue9OxbL8JNJGgczLs6RoE8ea97aYVIQ1HdnC9WhTCkpJzg3uQiYdhVLXsp?=
 =?us-ascii?Q?3WCV6kj+XIduLdXc65gYowpLH/6nLFcRfuQYRxUIJbpcjuyqTtgd+6r0aoTE?=
 =?us-ascii?Q?rGrConnPBgG7KVnEGZymFONB0bR0f98oeSHTknxd7m4rJCo5hrvJBtOizOzH?=
 =?us-ascii?Q?kMyUuWsIy9UjG1upqo+FiA39t3epXlbeFRtpAm/3jxJFKyfwPSsVgprQ8Lpp?=
 =?us-ascii?Q?TplP5GYwc/GeoaT3gzNcE4nNX6dcWa8GerEZNwJi4j87g06ALJ8yhK7L+pjp?=
 =?us-ascii?Q?Ljlz3Dx6cY9NRRRBCJDbf7wltO56a5J6T3dNjySr/jKXpaI7dhDa1T+/X9JD?=
 =?us-ascii?Q?L1ddOor6qz+CeopkCB5roFPuvEj49htYFb5LW9kgEVksQfeS5nA+DdTJzIyf?=
 =?us-ascii?Q?ugtw6OAoAY0qgRCI2SloYJk7xXwue3C0Yr1XnjDiiNWd2/fdvW7nXxH9NiC+?=
 =?us-ascii?Q?/0XFDAhe3VeFAZtl82dfgWexm7CwEs1KIlwCWeAdQH7Q7LVedNcBEDZLglcK?=
 =?us-ascii?Q?G2Cw/EIjku5NSc5aAsdQcpYD1gsl+tH0n+sUNPrNKMx/A/qSpMsshqFM2lTm?=
 =?us-ascii?Q?Dev9ucEbgOXOPAuaSsjnJpoj5ejBTqbIoRTVFhG/DUOsXmZx6RirLkdkqTkz?=
 =?us-ascii?Q?wTWI8eUwPA=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	UmnzHsPO8bb38yPoXDdfV8nuBCZ/HRtt3f/8921OpcXrfIUBQI7drWsKK4ZUYxVpDfM3yYLXea7grbcgDn06SS2IrSZSeLkLEObkSKk/PlMHcIefxtoZnwvclcot8fF73qKJzhfEdVZH/fIe+Em7e4wNQ4AynrfML6i9SEC/OCVFD0cE3cfc2Y0M+baXUVVDbVvzGsZzenlv4OxFNSKc9oSCGARPFkmm9OD7LCjEiCdP6lNpV6u4tRlFsiiG9u5+PVgq60FDWteHnCzu6q8VFOSbTGb8FzguDocSRa4OXyt8e+zwNSCUlS9JKEI0gfdHIMghR/PvTsMWmEfNlSbb3w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	36LYIshR1KH+rai1dYTuVqZvDW0JJtAUjtnkh/Y1D6z+jU5xdLmLPp6+ZHFP51MXBdXYTscykaQ7T97kwGOUR858lC0Bt1iCLVbfo4MZegKPU1zD6FaQdB48yBbJGjQHjQMVESxW/GK1oadQaZkbReugpji0MYLUtKdm3UBwM0y3ctv+VxfC/hrq7DY+rRBQa4pscB6CyhUu322i/AmVA2LtnF+0PHivVtG0RV+TsERap3AmEoWaYBBdH9yuAZNLqOwfCHu3aJyGDgzGgE6qlLh6bqaHSXNZhQdOJpdzPKcUd37ku02ahHooPibslbs2VrJ7RzbxTEbyj6slv86BltnAl8VIRk/DVTOScEoRRrsYjfxagdpQbAoS2jqnxERTRiR0w2NBMjZjZ8UzMM8kg8mQlELrB8+2DwGPDIv0YJcfconA7XbGfJIsOSY/FFd70PzeJ/A/eSI4Q19zZfIxWvXDmEmwOWnErlpTX6KfODWzB0utFrL/9mO6g11vOXNMISB3HSnPyr+Rf/L3ApJ+xQCxF3JM6rQpC7nTbHBs9qwYv1meUx6UC6NxD7SvpDuLFvBNXxYFH4fIYcX7kJ3m+cjsh+7Qk5Zu+L0jd9QRKz8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b5dec2-188f-487a-6b15-08de8ec1328c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 01:02:36.2469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eItrBGIppeK7YM+BQI66mkZflPIpdLmAyTW8MLj5rZP5HaglXNg2T8cp3cQxvWg5IEc1W/Wu47pMXwmlMvclbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6130
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603310007
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwNyBTYWx0ZWRfXxWRaaP6JaRpP
 a19otJ3ZjslWzETblaRSZQxjnLvMAQjISib457SQ9jeQt/GRVEZyoXSbUonY4z42f7zgB8AO4HK
 PlF+U6ee59AQyILRSOc/maM7niXa53GqsaVhkpncL7OgugW2mfmo2pVaHAqZnfhbfSSSb0fmVXK
 jhrQ0svbA1UeErNARYzEr4fQLBfKt1D3W1XyMAHT9njVuwq4LWPkvXC+AZLOck8NagOkl2DoGUD
 dvCDyLTxvYh5zEKvKjhLSp+F2sWuxh4SoySeZqFpiK6OlvceN8t4b9SH6lET6hdmz8IbA3JH2TB
 pZClN7koNz2u9afemj0q4V9WQcygNgQe+aI7Bwc6TxZE74rlzktLZMsjk1rxnwRnawRHXmgZztH
 AMCTT+8idAHu+jpBM/frsQw7dzyHsH0xvTfpXhCQmPCGLKPW3aDhkO7reQ3ivHKcsspSiMkrlni
 WYkP3/wj9+cQt0TeT2UxKF1/C3z3vR7pGP+6GiVA=
X-Authority-Analysis: v=2.4 cv=PJkCOPqC c=1 sm=1 tr=0 ts=69cb1d32 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=tvuHzLcB-jYbYH1duVQA:9 cc=ntf
 awl=host:12275
X-Proofpoint-GUID: Pwm395INVFveA4maiJQYoh42WL3h7lM3
X-Proofpoint-ORIG-GUID: Pwm395INVFveA4maiJQYoh42WL3h7lM3

From: Eugene Loh <eugene.loh@oracle.com>

We test that declaration (with init) of a variable inside a probe is not
allowed.

Check also that declaration without init inside a probe is also
forbidden.

The related test/unittest/probes/err.D_SYNTAX/err.D_SYNTAX.declare*.d
tests are left alone.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../scalars/err.D_SYNTAX.declare-init.d       | 20 +++++++++++++++++++
 test/unittest/scalars/err.D_SYNTAX.declare.d  |  4 ++--
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 test/unittest/scalars/err.D_SYNTAX.declare-init.d

diff --git a/test/unittest/scalars/err.D_SYNTAX.declare-init.d b/test/unittest/scalars/err.D_SYNTAX.declare-init.d
new file mode 100644
index 000000000..fd8dca6c0
--- /dev/null
+++ b/test/unittest/scalars/err.D_SYNTAX.declare-init.d
@@ -0,0 +1,20 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION:
+ *
+ * Declare and init a variable Inside Begin and make sure compilation fails.
+ *
+ * SECTION:  Variables/Scalar Variables
+ *
+ */
+
+BEGIN
+{
+	int x = 123;
+}
diff --git a/test/unittest/scalars/err.D_SYNTAX.declare.d b/test/unittest/scalars/err.D_SYNTAX.declare.d
index f5b2ea914..b26acd04a 100644
--- a/test/unittest/scalars/err.D_SYNTAX.declare.d
+++ b/test/unittest/scalars/err.D_SYNTAX.declare.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -16,5 +16,5 @@
 
 BEGIN
 {
-	int x = 123;
+	int x;
 }
-- 
2.47.3

