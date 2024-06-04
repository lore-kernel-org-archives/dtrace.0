Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37E3179BC
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524023; cv=fail; b=hSrEn4PbgVVfkiIRVffmy/W1ue2dAG7RXYYOuz6gsiSKP1+hMlHMTSDBJ/TMW75C+gbRuUrGlpnW+KjdFYv+hIbXUedZhgm9Lm9F/8ARgNXjnFy3iA3uDR7Xs/TZT4coMh4OzOvAq6umcQCjzXGkjAEA43G7DtmVOdMxY6CwNKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524023; c=relaxed/simple;
	bh=PRYhD6OwIP5PgyDAcgnCUxzmHbVhRirV/UZbTutOUt4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lXc43O1YGKFXhytoOCowvk3lT0P9g30Pk4sa+ziZtSh2/9QIVPHh7EETi71Dabc51bkjkTsBI+PN5gxJvnqJl2GjiAVrvjSc4ALrfU++c3UfoK+FL3fNLWNyGjFg3jCDjWPtD78l+lIJ2pepTaXytACKNGRcbNARGlUjhpppSUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454Bn0xf032315
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:20 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3DFNeA7+IqafgdgC5?=
 =?UTF-8?Q?d8RXb2rEgVKPkGF168fHgwzqIyko=3D;_b=3DMxtvz65hgXM5rZS2BeJXNbdRWA?=
 =?UTF-8?Q?gy6PfO4fOqslqnBAfw++wV99ykM0uXYweROZkwVnHX_qUeg5D3icJJUKBTlI1wb?=
 =?UTF-8?Q?OXrKgkHwOVPKH/ZNndgDhNj/aVjjqNW5O7VKU/MzMDn7yeJm_4sjv6TfhOe9vC7?=
 =?UTF-8?Q?6VcMapsk9hhYdZgABdQwNuCWfrE8uJtfJDXqgWANlrxpaYfpEiuzIp_5T4/qP9d?=
 =?UTF-8?Q?A0NLWlyIAFnALUPuh2szVayRIfFM5PLrBJxVb3W8H+EQayOenVo42BaIsTSC_ve?=
 =?UTF-8?Q?dXe2nHythJpwGqqk2iq07TlGA6rk+W/JIeofCRoPL6uGNZdi+KmFxqqgR7e5Hz7?=
 =?UTF-8?Q?4/Y_YA=3D=3D_?=
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfuyu5k7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:20 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HSus9024024
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrqx6wd6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DE+27azEa86QA2G2gu591Nu6+r2M67oDb5YvlV/lgIyeUOOszYLOVTTFrxtxD7JVvLNBSlE0Ll5ct5YsQvfu0ZMLrGUY5ACJ+U89U7wfb36lImIWTUezEkCAgqtLSoLN/4qyI9dcvonsr930gE+moxNVrkrRo0g8x9upEWcYg8YF8fP9K7aDaOoxtcZk48jDvGuEMq51wwyhFb0usF2diAOOlnQgYohIvwYObZr+5AZ+SJKce9TijjBjOnh3uwIPzaqA8U3F0KH87R+8xAC/KtAsMBSl93vHlxvevV+pf07r2RznCuuaFyYJ0kMUfpO27tTQgAx7fdk2+xkeMy7Nrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNeA7+IqafgdgC5d8RXb2rEgVKPkGF168fHgwzqIyko=;
 b=fr8tJ141d6c5gyzSBOfZCmm61LOKPcEN7TzV/fye3OTiTLt7SDrbxNGOsl5QYCSXUzo+RLLXUOwtIDtjnt81U3zJ7YHkxvaSuVUzbleDcKd7Z/XQhFOVEG5TU0t0oCZFoj03yvq69LXxt3oPxN/m6hZzEuoKNgso4HW+nS6kSMi8vx0dKYG/ayDAjAIGfwQssaH0F95fNRTPHvANVUKv0ABUwrkGbIb7/HBaK4UCJ121v4QZEZNA0F4y5ah+MDLWrDVL6/48ZcTPu5AEw3/yXlZnDsgrObKCCf1rRzZ5OgKR6HeisXGAc6ueob3I4tzQ2+vhtOvvZNATRm+ltoVtJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNeA7+IqafgdgC5d8RXb2rEgVKPkGF168fHgwzqIyko=;
 b=Kzqo0XtBKLqUKARv25l2Avwt9TKCQQdFW7YK3Zjq+pn2S1nL03zGQsTXMReKm32NT1raTUPZUU57puPgXLFFOTRxbfjlgizGA7IhevFGSnDpuLrUcayPIQH8/HclhPQJ7yhu2byeGAcVjpuq2kI901C1JZYkR/GBrC41d86+oOI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6574.namprd10.prod.outlook.com (2603:10b6:510:226::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 4 Jun
 2024 18:00:17 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:00:17 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/8] test: Remove unneeded -w option
Date: Tue,  4 Jun 2024 14:00:04 -0400
Message-Id: <20240604180008.11331-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604180008.11331-1-eugene.loh@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ebef844-5a43-44e9-4e82-08dc84c030e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ziRLBxAHTR36IDbyE3wp2Gxfpr6/1gpmtmg36KZzAvMku8Dz7LryrsGs1EHP?=
 =?us-ascii?Q?ahfEy2oKRJZCK0RC5YGYmpSItnRvjBJi6mxyjSDP9joQxLTLtUojGv6wmzHa?=
 =?us-ascii?Q?OEGisrlLXL4pweNIc6/Kx5VYxXFeFUt5dCir5LVghnh62O5LCR2AfHoUZDM0?=
 =?us-ascii?Q?Gd/opHFkGVchwdnmMHd4f9vHSoyQe6IhT8+d3UEel1qrkIIzme1yPqE2v2u9?=
 =?us-ascii?Q?kICN2F7FHV/JoT/rLfwSMSE8+TgQLUJNgIYi3uonOFV6lcIjdb/oUYJzNqeh?=
 =?us-ascii?Q?CXj4bhPOaQ8BrjJpQqQqCaKgD6HuFFBF9Zjva3Vb46URlOjTbSxHpXyKEa9s?=
 =?us-ascii?Q?/6ZKn1w39xnu9skLDQBcsSB1U/VrRMnauOI9Bt2cCjozkAcPRxBp/m9wMRcQ?=
 =?us-ascii?Q?ziSd+x2EIfRftYOuHLcQ/fZ3SVr2GmEYMhxWC7lOG7jioaS5aR4ULjfju8il?=
 =?us-ascii?Q?n6+2DXRppYV3lcmCVwzR/2dutr2u3sjBozBgJIaYCh17I4ULjwClaYrTHU4q?=
 =?us-ascii?Q?kWjrf4RQ0z5ZacgjJHjvWBKalZx188eHt+c97YpMZcWaN+T9rFEhbHhZAg4R?=
 =?us-ascii?Q?BEq5bytCxtQpWdVtDevSUS8ah4lj46b+8EPhceU2yM7460xfqgDna3H4XNhx?=
 =?us-ascii?Q?k7FmppG6xMb2QXCrVGu1xKAmQngEn8QBcN3uJYqmDEvddiZ77ayPJxj+z0R0?=
 =?us-ascii?Q?yxb9IZGi91dJtFV6xWUHlkeVjWuLJPCnCTXozs3mVURZIR7WcB+oboXObJv7?=
 =?us-ascii?Q?J1+vtuIj8yN1UfrveWvIf+KO7ct4R2CCwMH5CAk7BCCbkqlwjbCOENoGm5M/?=
 =?us-ascii?Q?3wNS+3RLt037nu7sFwqA6zysSXZzSUYjgOsm0E/2G1RmnKfoWF01TQa/DsbZ?=
 =?us-ascii?Q?lsdXOe0SzXvaFtj716T3hLrfmtiBXgaelzC7H68MEiBuN8RYZ1ryJsIicgtX?=
 =?us-ascii?Q?Xvj4VcbrKjnlVkcVXeMRC1+54qqeiiCUzukeiH+KvlStXrkWyje4AJ2CqB53?=
 =?us-ascii?Q?HBfNrty5WCvnonUtD4ayDuPiSPBVO0+JwMDd4YIm+PfhhbODqQZTVR608X5O?=
 =?us-ascii?Q?M3g6zuE9ikM0YvV+9kzy7ID2eIg9oMZtYMh8Kn/XYGpvS0SKTpEfhrJp/wZg?=
 =?us-ascii?Q?KX+UuPKb5UlV2DaJ2KqA2UPc1qnrcekWM+/P7glBvVk2KY5y8XSRqtHvn1KC?=
 =?us-ascii?Q?nmw5nCYwEYQPyTMyM7Y064MDhlFVZSy9muWKN715/Y536FLiR6GGJbRXCdsE?=
 =?us-ascii?Q?HWe0cj1f+N+johG75pgIzbQF0QrK3mM7lg4UrVIpPdbnjYb9TYnhe7KFZ1AK?=
 =?us-ascii?Q?3q/bG0d/YdJYnV9x6M8dylqc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fGqB57Rk1wP2U6e1gO+9BNJHI8mtp3JDOzlqPA6rQpP7ZjyTn5sBhthtC2tj?=
 =?us-ascii?Q?koqDsK0FM+lRx6F8Re9EjFLLN0eQHu2g9JQ6TUcL9dSP+gjif/9ItD2jZjYR?=
 =?us-ascii?Q?zz8ftnRM7qlL8U9II3uF005bOCbo5v7/ZFPJrsFbYO3NwGwzBR5FmZDKel8r?=
 =?us-ascii?Q?kOUD1p6VGkPEVP7nXJ4xX6Bx1NycxmF293UDWSufzF+76iAli0xVQFtLrIxa?=
 =?us-ascii?Q?a4apV3o3kTaq7kbyriFcBfZwhNRW5xf0fFhL28/PIJW1/v6+LWmC+Rq02XbL?=
 =?us-ascii?Q?AB4sRyQ4EnCO2AbaKAidcbCKEWPwAzqLSsa6Asgd2pONW16o8fCuDBB1Sbf/?=
 =?us-ascii?Q?8g0A8wv7hO7Q8qwjHEOVY1Owj+vtarAbQyq3n4AnbcDvVaKgLOA4gj5XWxtx?=
 =?us-ascii?Q?qaZV6+j0p1hrRryJDWgmTHsSBknB6gvtAoIY1TGjHFi6tuefkdcCvBfEfmUX?=
 =?us-ascii?Q?bfRH+O2DbHQhdDgR7sVTFInQrL5s6jNGKQyZunAlRadi82KEW97LHvTruSNB?=
 =?us-ascii?Q?WTDKAP8d7CA6r/rVIDjiQTqWTI/VibaU1cXtfar/+eZzTrIPryHNpBPk0ZbP?=
 =?us-ascii?Q?mGaNMaBgzkSp415WPXyO/mdLaVnvzQ4dX8XE3mvfeysY74FU07d3deU09ugI?=
 =?us-ascii?Q?0IvLWwI+/q5gsAsmtNrDQWqnSdhYhMywrPParIyYPFFFIIpnwuTOeESnbbf5?=
 =?us-ascii?Q?sODJyNzPYr74ad7eAgF0qOYW5u70fmRc/AM7UdrqU47MWlKOZXgEEdIXhKJA?=
 =?us-ascii?Q?GuloXVb+8puMGoVP/l+ksjIMH4axs86/KbEB0IeVyDR9GeAF8QyIofo9N9Fy?=
 =?us-ascii?Q?bJAAQ28+LQ1+fML6CI66pumWBlJKpoz2n0LsKxvwlpqrdr7ZgULBTl6My6Ts?=
 =?us-ascii?Q?fh/dno8Mt4RVv0k85xlU13l0KQCreBX8IBca3Rmis3jzpfoz9mqrFiCkRyI8?=
 =?us-ascii?Q?sdsgJYXb9MZT7JXWWSXqPyEEucMp4jrEchkYIpj+Ub6b4XsRDFuHuTmVb6Nx?=
 =?us-ascii?Q?AHq/KvtXvpokxpurNeIKBndiUhn8ajfyF7KF8Wg0yum3Fx2ampZ2XDwunjAu?=
 =?us-ascii?Q?JM3uedX80nqnLu85cHyffUMDU+d1L3zeV3lNCaJFXACMBlUCm5hxffq7xHdv?=
 =?us-ascii?Q?x/ZsMgLvFFsj3BG8oYIEy8tHVDEDRIG2iziE2MmS8YiAhIa/KVL4w4srJUG1?=
 =?us-ascii?Q?0L6bLuv2/S036RUNMgI62LTpmAsqIKmeYY5HSM7dVHSs2cBL2QUnODgD2tvg?=
 =?us-ascii?Q?HSxWVPcdifVZ/lfZzj7bGavXb9OrTbRo7jpmdk5UaInJ+eMtgr9I9R2k9SRT?=
 =?us-ascii?Q?ydTtAVR/IsBOpRfj1OBFL9s7krqqsHB/9HY8TWf/HUP0/mtip8gaZEB9UNyM?=
 =?us-ascii?Q?5lKXEOYzwjzJsO+24OyypepqKypgJqPv7LrNmUoXv2h0aRn962bMratRFQm1?=
 =?us-ascii?Q?o64hF3EaapqSjYBonMAeaek8i1m6fThaCeYxxSTt5+zYW9owyHtQo4v8d0yN?=
 =?us-ascii?Q?QBW9C+9Er2DttrW6I1Hwz5Q5EJYM+tfwDnBQ7mZQTJNCqDQrFyYZlLE1usX1?=
 =?us-ascii?Q?Vt7awzIetEWHMM0NWx3MElywmAnHGk7q/Q85JNls?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	lmrKINuD5jzU7l1zK73KQqYhPQYvp/dtLdESd2V3ny/TwRO63zfmp7EllOD07X21uKO5s6CZmLb0buQht7/WhvgVrRPz2tOBKXwFwOHRZSqjL/zx/qkfK/qqQwnXyeTJe2yROLRdPZrOcqmZa4RdSOrTAoq0iL9XACB6/ALqZjllN160CW1v6aTGZyiTG9r7LqKT6ogkEGRJnGonxr26F4Bg9n9CuE6Xb0O5vwRO+LkDfRQg3wGsIEi6FCUCktFCik45JBguIurMbnSv5kFSmX+lqgtHEMB6kycgGMXk3/NjEm/J4aaV6Shg6Dn88SOQ2PqkFwxciMUBzGH3QBCVz3jhpJBRs7nqHitvr7KqxNKS4vy1kjlTRvgyWMlAobdiSp9pr97AjXLwtpMqzpQ8PVhekg38aJTcj9Y+PL7e5iFw/AntVQOxr6Klzp1VtiqWGjFXQHweGsLEqAJVMbg90qenQhBuDSDN2WXPgzVzLdlqNmYTwqUxTXuPR88L/ZTTif4FeP0BRj14rItH9wdCwmiZ9L0MwehWrL2kL4VJm3oeYaW3zRYLlAqY89aT5Fo0cRcRYMzTaWZPkOvvUdaLRYHhkhwAZ7So5zu+MAW07KQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebef844-5a43-44e9-4e82-08dc84c030e1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:00:16.9745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hoQMFZEwTj9Z88eE5Z6aKZrY3HfYIZsQIy6/52uYCFN8h7Q9WVupGBdwtMM4FD7uGMIZJB9VC74r/HN1f1sHpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6574
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040144
X-Proofpoint-GUID: iw7d-D3oq3SSZCzSsljRttHVMB_c8MvQ
X-Proofpoint-ORIG-GUID: iw7d-D3oq3SSZCzSsljRttHVMB_c8MvQ

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.dlclose2.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/usdt/tst.dlclose2.sh b/test/unittest/usdt/tst.dlclose2.sh
index 94be773d..6044cf4b 100755
--- a/test/unittest/usdt/tst.dlclose2.sh
+++ b/test/unittest/usdt/tst.dlclose2.sh
@@ -128,7 +128,7 @@ if [ $? -ne 0 ]; then
 fi
 
 script() {
-	$dtrace -w -c ./main -Zqs /dev/stdin <<EOF
+	$dtrace -c ./main -Zqs /dev/stdin <<EOF
 	test_prov*:::
 	{
 		printf("%s:%s:%s\n", probemod, probefunc, probename);
-- 
2.18.4

