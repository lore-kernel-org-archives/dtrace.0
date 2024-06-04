Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8CE149006
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524689; cv=fail; b=bLuNOL7dFFMWxf69FjJNOT93sieYzKRSoRtbhkZE5PSDMmHVoxcQctU+Il+uRIR4M008SHNOqtUG6UCIpg3bfHrxjodW8oeaXLnKsOSEJuJEZ2Sja882HMXOgN9AcvVGOF/omLCdX04aWGZCj8Ee7hqECHqtSccxrXajXk7//Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524689; c=relaxed/simple;
	bh=vkptwMnAebghP2uWVijL+Hl2WlA9xGphKrMedIm/ldg=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZlrpuyRHJ2464fOX0gr62bL+FF9uabd+mE3XM1RggeQAkJ6x2GgvcqI35dS5WyprSDa5PCgBZV/Ez43KDs6sGshk6r2DvMQFsAvqzsyLVP8/HVt0vy2G2g5OdMjQV9l1svCvFl9y7jVa2NWKeq3dIYuJrrDm/9XxPmR1pD8c4ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=izKdzbWY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Oht9d3Dn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="izKdzbWY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Oht9d3Dn"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BnW7p032110
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type:date:from:message-id:mime-version:subject:to;
 s=corp-2023-11-20; bh=bu8xO5AOvsIk5bnNHeXhPKa8I8oTTsJk8d9U7djcVYk=;
 b=izKdzbWYFw7g7IkippEu77zOs8Azcs6T3dv23ySc2uM0DLW/+L6WWoB2Tje0IHLkxiDH
 9w/4vyT6MDoHNX9Eeix/nOoG6w42bOT6OgvXe+hTndUrC6OAzeLAWNWcEPy3v0mcCS/u
 ltI8qPIzqjxEcQSqdoVPRhkiwud1PeXTEj6DaiEMSzFegeUEkH2fS0spyh0VKfO25tUX
 Ak+f59gUDaEqE3MsxU8ReFVNyk6W0lEfkacV1fkYCzLK3UvgaGa05c0x8QW4l3G/1A3A
 sM6e8+Cqvq8sGSaj0mRTREVmNn68J6bwC+nDF/EJYje+pRnvPcpevKgNF8FcGDpbmN34 Tg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv6u5mc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:27 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HhkTj020535
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrj2cp1f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKiTQHOTf7t9y4Z7z7i9aTv6VR41MpwKfpS9JKVwp9diTvm+BrbtQV3zJL9rf5YNOaze9Fq035cOX7Gnh2diNqLDw2JY2Dlcn0YKX05k/xUfRDKg4xlR2zHUwvlR4SXCuR+4E7OX4JVbZmxjU3/XiGUddUH7btYzbl+AFAjB8JRaRvU7NTBmUjm/iUSrdK1sRpOKM7dUiET9ahK4dlesly+DxmKyW3bEesCZ8c3K1unOKsBEo8VvBnl8VpqJ2/OuslOs4EvJhZ9/JmwnY8DkT6cRh9/nyEnOERKPrV0/LWdBu4zWqx4ReooBInttFEDCOURUAj4VU5RID8TN5Sg8Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bu8xO5AOvsIk5bnNHeXhPKa8I8oTTsJk8d9U7djcVYk=;
 b=LJBw8QSMZ8Hoz4q7VvvJ5f1p/X+BVYs/HmrVu0TkaOKUyBDidBd19Ei745Rv3dkiZjDICD/AE/4deJaTuwgcpamSjJU5p5yAa5aC3JnflkQg/DsSb70NZD2V8bxY3hmhB0SU6E6690NnQCz5as/W+PafeBj3fZ6qYWGtNSbpxDd58EEwhSmdYXsNbtlkwY1vonFtWfy9YLjfrCRnr3AnneQdmMu4uvYSbzVErbFmL5ZksRVLOjd8ORyDktaVaq1cDFis7M6ELUYPheZg2bePM7P0Uzlt8pI26NhUtunEuzIXTBKo2U/rI7DWV4QxF+0l69LHeX5q/Mx+MhB+tziR0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bu8xO5AOvsIk5bnNHeXhPKa8I8oTTsJk8d9U7djcVYk=;
 b=Oht9d3DntCn9tqbT+Vdt5MnlOUM6ib+8QaecKlv597zpyx/NRdkYZWdBhuchnoyfq6DMmi7z6hG1G2RzUoLrCcZH3e38+asnARpmGz4UJMjOqcM9FzsFxgOEOVFklUqubkx9t9wHsJKhskSrl5gRIHz+sD84z/ID+FZBzvP5xeI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6799.namprd10.prod.outlook.com (2603:10b6:8:13f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:11:24 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:11:23 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: "proof of concept" for systemwide USDT
Date: Tue,  4 Jun 2024 14:10:59 -0400
Message-Id: <20240604181113.11505-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0082.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa18012-e898-4548-d716-08dc84c1be5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?m2O2+QhKtHTzmgxELjYnHmkkFDzqu5yokb7XDWx7DdpTzK9V+rrVKTjxGxQu?=
 =?us-ascii?Q?t+drlPt64RGwIL/tN1dTfUcLsLPr0bqbCefl40F6M88YogpVvm7B2u1eEmS8?=
 =?us-ascii?Q?SS+KLGDM1HDMwhr9wz1vp8uABDtnp+BCji1Nkc0d8YNQByw/5XD1UvdGZDb5?=
 =?us-ascii?Q?QD2hl1nyLWoE++rR9ae3WXl6pnNBzWGEvgGqNceKDH4CwL3GJWtI1Mk36cmO?=
 =?us-ascii?Q?N+EOgOD2CxZWwyvv+m0yoJkOhxUSWscp1RQPceLXPyfJ/Rj64IT52J2zH1J2?=
 =?us-ascii?Q?jZwNx2Y+ModEhVy1O3gHZkPqXN9McQLEeDxTrH1hxw5N1Yus1WkaUeQ3hEKd?=
 =?us-ascii?Q?X+zakiS35xIuw3lgqNqKkqSPnw8CjjRKxCHLLoMNC7K/TsmOBrXlHvZu2fUb?=
 =?us-ascii?Q?3mhjc52wQOVXZOZC/MEgEl8pEoAV/rq+YCiOVWkGpUoM+OSUfUNSYjEz7ZBg?=
 =?us-ascii?Q?VHW0r1H/lk9ZuRHQZ9HGe4bIt9VJe7monoByxWg+9TSZULgIEMllVDnKfiFD?=
 =?us-ascii?Q?P7Q7hLrPDQjcp/6m8FKwPaLqCeW1bay5v7crRQJfnL5lAvFmzZmhUv0hbdlQ?=
 =?us-ascii?Q?ahM0jYrGbYWkHwTkjMJF39TrFwfHkKEhYUmM8XKYxtH+GRwgL7F1ZESrABM+?=
 =?us-ascii?Q?IpMXsbjcjWGmsW0TdZlL5ECAgQ/CaIXxuArZ/MI+We35K8QNQx/aVNEjBpqr?=
 =?us-ascii?Q?AGcScYW63N4hoVbBaYIeXm83hsQHs02N3i9MtghgwckyKfe/plv602VwqrzG?=
 =?us-ascii?Q?OBuKLrFNjwGwwHkNJypAlHYPkCRTK4GktPH5AOKlIZCrD3uSRCwlKTJ40/fi?=
 =?us-ascii?Q?BZx6N8BbA4OSIkx5KmMyClMbAdlVtKfY+uye25Nk/EzPyATs00ILcKGbyTEJ?=
 =?us-ascii?Q?KKFP4fzIyns+FL0CJ9afRMNxuz2TYRddNz5quVliEMEZX+YHhduzOAzm5qfx?=
 =?us-ascii?Q?erlCIlhtwbtLFjf0R6UQzJmatbrZiNbZQnhBGA0uWNFItw5ks1zUQgBmyKSK?=
 =?us-ascii?Q?I100mYhIJOh4fxA+kub3FC8VVQ0q+EaZYdGwOQT+0xF9U4bn2NCQLAB9ZOw6?=
 =?us-ascii?Q?b1YCImLanDNgaPBOqIe26dLmeeOuPIZ+8R4szrXxGMcJnw7fpAVMTdtofw2D?=
 =?us-ascii?Q?vFyyc0OAicz0U/bnw/hgnZ27WFsLMU+4Hc/QsZkCswL0qgrjC0kJavfO//sI?=
 =?us-ascii?Q?WSEkzvJ/hyBIE9kfddQyEVTkf+vwVM1I7TO90j4g8b61rTZxeEBMCben1r1r?=
 =?us-ascii?Q?wb8qr+d8YHpWWvibXFyykn4JaOC50ykz8p4FB3+zLQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z6myOrgPKyBXV22RA5FoRs0b5tPCzT5y8j5RbTehJ+N1OVnaf5m8OVzGobmi?=
 =?us-ascii?Q?/QhjedrDBZbQ3ps34OFml5FObbi1tIrRdzvEZmndZugFDT+86VCmbh6PcK2H?=
 =?us-ascii?Q?qNJK5NObh2HSR9Pxl6wAFrdamgsKkxvdoFfKZYR7D7diwU9NPZ9PMm/5KLuy?=
 =?us-ascii?Q?rW4dJCgW4Y2bc8MLf3msEZVCFTHm1PdRMGd9sqX0mRypEcHZU4TDhANqZwP7?=
 =?us-ascii?Q?2sYhiB2tG/atng7TaI27o47TtFUrpPnZ2m0Pk+AVvypU6NTpdo9SRSa1hYTm?=
 =?us-ascii?Q?szmbqCVw2vGHfkBSXca1FaWtq4u3UiY/55gpxq9hBIln3pzVEJhFv9p988tV?=
 =?us-ascii?Q?0wxA7y9IbGQ1LUMtaCHSkCTXnLAzSiCVXzyHw4vtGrPo5Ap94d4SKyU4mOog?=
 =?us-ascii?Q?aWwMoeqcq/WfX+k1vcUGPs5hcU5yWzChDxFHxR00gVpaFmkMOOMWsY84vi+m?=
 =?us-ascii?Q?lJISgzbcXvkuMjyNUsts4vleBE4c6xhibbBUfbQxwdvkFh5Fgg6djRl5GKXz?=
 =?us-ascii?Q?KyzUIo+NfI0+YbqrA+UPiB7cLW7qW/SD/cwVC7MMKNCH3EqXXVAs8tPHl5eS?=
 =?us-ascii?Q?sd9DbNJhNlgc8CkXZ3CqCCVwzHHPiQDyCBXE/xA93o8DNcgixwFprOy+pNDW?=
 =?us-ascii?Q?UNVZ+p0fYBdiAMhSn/gU8qZJKIKTm4bjJnLQSVp87SMRlbsrVo4RNo+t/DCp?=
 =?us-ascii?Q?WhaJYrPon3YwiDYPVyPWxtGCOcFVkE9L73htidQnQ5dArQjovnfW9nHhUJDK?=
 =?us-ascii?Q?Ss8BRKvbSUgxymvIhkIpPGnlBRaCCcAJRuvxJvJ6/a4UYpvw4f7pDTPxAwzM?=
 =?us-ascii?Q?S/LmtxTgcTetkEUyOjfcknG0lkjuR/6JErejTixnS6o9UL2aQ/jpGiioZM1y?=
 =?us-ascii?Q?aHR5IjFamja4mkAe+i0kWrFpZsBztL88IR2A2w64xOJvNOns1DEVYxlFbrMu?=
 =?us-ascii?Q?IMax3PJ+IpLAHTOMuO/cc2OVqinzecC+vQkFqUwNIBbJ+lHxjjXyFKIdUdQM?=
 =?us-ascii?Q?LbaYtjFFeLxA4j14pidmLw2E+yk3ND8teYfWWZ1zbZ2H9Rys5H0wBcESupKh?=
 =?us-ascii?Q?dTfkHRcqHkxv9LDCT/+5FgcYb2XhaPqs+LDcSg/KOs08N8qeOpyycpjHdn7Q?=
 =?us-ascii?Q?VlQbdPAT3lWZxFZdsDFXiGtrL79uGPcWSxM9LMZ8+NBan5giuZBbXV6y7R+u?=
 =?us-ascii?Q?v+cV3u7s/M59V6ci5G+ubmJgl4uL0BIW6TmYbx2hYJ7fBs35FgT4TKLU6GlI?=
 =?us-ascii?Q?qhJ/HqnslNDXUJH1NQNXobactoMTeMvR6wR9k0k9gb+umXS5e3ZWR0SnHBIk?=
 =?us-ascii?Q?y+ceqLJQBRtQ9ouj7ebFp8kun1AfYm8yLSrBVGBnrT+wZyjnSabEoEt3Guw7?=
 =?us-ascii?Q?OFu2JlX9eiSb6uJ36BiNbCPptlZNQk9jlxqJWR2feyugb4OiK0hTdm9WJp8s?=
 =?us-ascii?Q?kQlwA24EW5nb6VR1HXaMN9B4dXwLwNAwhKqOfETbW1GxN3Q5R6Fkm3eqzWQC?=
 =?us-ascii?Q?TsW2XNSLdkXylqs+LgZBLTVdrqHyGFgGQwrw5tjwi7k4SImcNSwgmLF2T6xZ?=
 =?us-ascii?Q?jlaJvLgHdv4uLO+nIMW/F5g/SQCN4PdebZZSANdq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	KE7kF5amysLx764EBbvwV/UIZY0XWn9j8ihK+ac0MJ5kQPo7xSGbvz/LkWhZoaPIPsXgeedoIsaq+EEUhQFf9UOOFb76vZ0zmfQ8BSANUAyH40OcM+M+QiA62QoVVzsS85Aw+4L10uxa6dng/UhdezFXaMkmu7nuchMKyFYb2vAMCgS+NTqtGrLyhjHFqjIRaL6hYzD8/yAw42pyPROT89xPFAjtJSTLIk+7osTjycB1w32buW9y/ikfRZxAK0PD5jD29hXosufmAsNaAfIT+fFTRVPKfpzSyZ5tEjjEB9KTp46FQvmmRX9Z9QR+KlRhZifwZelRooxdmPoURALK6hgJNz0eaUdLPUZ/quuN8PgRvRjM8t5RJQJNEsQk5H9UnWPtryngoFSbruV8Dg0nQivpDhQqDFk+N4oyyX6I5TKM/ktQ25DRLMOqk671ncqiWj6CvGcWhj4iWwc0yS/BsDx6gE1TJ6BDjS/+lHqxFQ2UlyJ1j0HRA2q6ZcJcTNLY3BJl2gj6BHqjZBJUdBZ+pWbVZ4OGNzYE73gNhL+7pd0QX3hiMp8gfC7EyyPILhX/W1l9EmOjuhcKhbQGQonakZ+FmsYGvNX5O+BETCiPXKs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa18012-e898-4548-d716-08dc84c1be5f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:11:23.8763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ao0sSSNuzbNxk0bOt018ciL32ss4TsUjKS1NAmEE4LDE+MP5EElOINpVNdWIImGiTQT8FwBf1L0CRXBbRlOt5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6799
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=620 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040146
X-Proofpoint-ORIG-GUID: 3i-EPr7UL24TV8ConvFu34LMvfGMgVRw
X-Proofpoint-GUID: 3i-EPr7UL24TV8ConvFu34LMvfGMgVRw

This series of patches illustrates a proof of concept for systemwide
USDT.  There is much cleanup needed, but first I would like buy in
for the various implementation decisions.

With this patch series, one can specify wildcard probe descriptions
for pid and USDT probes.  For now, only processes that exist at the
time dtrace is launched will be picked up.  An underlying probe will
look up a firing pid in a new BPF map.  If there is an entry, the
associated PRID is returned, along with a bitmap indicating which
clauses to execute.

Since the PRID is no longer known for a clause when it is loaded into
the kernel -- specifically, a clause's EPID no longer specifies the
PRID -- we write the PRID into the output buffer.  This is the new
mechanism for the consumer to figure out which PRID to associate with
a tracing record it reads.

The major functionality missing is to be able to pick up new processes
(and drop old ones) as they start up (or terminate) during a dtrace
session.

