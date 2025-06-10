Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD7B238D56
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 21:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589853; cv=fail; b=ZxG6Lm54ZxiaO6EZMxGpCKpsVTpgcvxritlmOq98jp6ruuTrqVsH4v3Jzl6vF7JIs0/i4VCnoo6MoRZpUh+clQeHNzhYm0rE5YbTDEEbY8Vb4A6GasWkw9RxB0Ou67dEKrPpSRfIi8nx7U9xjitZvhVPyDU6vNaTqnmnuT2ABv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589853; c=relaxed/simple;
	bh=exD2DBRcWRgFh5ZmsYLJFS2r+nMsZwwWCKw4YczlUas=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=F+vSCnpu1rFywj/l5K4ykrBzP0A34G6HjA78trfVy8+GYWDvUnVqfGqBYKwuNNFOrZtqp2Rl2RPjHReT/0+pN2byBHiPCUuyCOXnWAUv/j/57i8//D1WgL+X7xyqOT/H3UsbE+xN04PRBzDpcH9nIhdk2pIcOicn0pm+Inm4V8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rvpW64CK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pv1yKiSy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rvpW64CK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pv1yKiSy"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AK6lVV025717
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 21:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=DJ8iZ0zJIDseS9ldtfZepY4KoErxOcyJwKJA1O2yvN8=; b=
	rvpW64CKjsG5HYb8kLA4VCtbS9Qw44JPQl+cs8cJG0VBHg3Z8xduUIGrCKvLTLM2
	zt2XE61pUjarVHsSHSQLAPl2V8t38N0g5YQbV5TqVhigbTlVMl7ToCJBVssIs2G6
	AA4CveQaqt1/cBgyIYayE5V4S8sNYdvLSzlo50XgAljrNFTE3zGy9RpRgDmQlSLf
	B9RGBQUEZeemjXy00E2vbHaS4pqXembrZA1kUJks/6a6JWq7hYYKxE+X+nRkDPHO
	2YpsDJfQMY3pTH24c6Kji1GlWC1RBCCW0vgNI79hk+pVrSooAj2XHrabh8IVUUug
	g6NDpKjeJ3/iIcCSKSS0IQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c74w56y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 21:10:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55AKgkEE007575
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 21:10:48 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv91hxe-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Jun 2025 21:10:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwniTIsdFXAmf5xdM9arzhJwxS4VtwDNYak62vgPpVA4L+ieYAtSXCoQs3lNgIyrRrPlHDmTsPtI7aD4PUcrM5N52ehf0yx5s/xEBAtUEdNhHLoh52/jl4Vogyc1yspKP+G4CIXTJoq9iAiq08Yez+FZMsrWycNo7TXY03NcUtGSPGgFW7E5N1w18fpf7EHBFuQrzwSdx9K3SZRCZ9DlTu+cv7LqKd4lmoxldk7hEcRZUvfWkXNhN6VAvangR6x7r+z4yoGzwS6FkZ5ircQxK34pGwl5H2vbiXtmJ4DbiXEwj8d6RiwHoxJVyKWHRPbWHDPAVNm8+LDAJXsPE2qEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ8iZ0zJIDseS9ldtfZepY4KoErxOcyJwKJA1O2yvN8=;
 b=HeHjYfWfjw2ZCy1Hd8ED73ueShYs2PaVt6Uy8NLSW8QvZZPoFSKpftM9OtCGFzp8lZdqVi0YR48Fgw51FsLk3MKyKQuvGANLC2lZmPMGxEBU7+ESxiJUq/NpNhmxDzRcBY3kvtobXX/HScNL4/aGFieKY7QoTg/ymwdCzugeH2kZbC+ONWYXSPjfx0FM7ILYgRzjUbb/3L9wpQt9Z45WQ0T7A5M8sVEYORvr3T+A07SmlRXdh/j+vc7PyMntTniTStNLzUm2QF5KkdCHF8KcqALMCFTn5mW20W4t6/CP+39cbMmDkbWBnHscbqJEnF6bYjWwggpApdf+Liz7msPi0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJ8iZ0zJIDseS9ldtfZepY4KoErxOcyJwKJA1O2yvN8=;
 b=pv1yKiSyLlh5pWkPtwxwUpb4JoFVyN2TfhEerh72JHU8Kn1HxhzPEPMcVmczT3s0npuScykT27YiqeA6b2D7A6iAcEV//n3kdCsnMkJ0QkVf+dtRoy4Gs4W0c9afqMKBUpGH1x3VAhSci+IFbM0vp43qf+vRTUyGE6Nf6PYdc00=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB5616.namprd10.prod.outlook.com (2603:10b6:a03:3dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 10 Jun
 2025 21:10:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8792.033; Tue, 10 Jun 2025
 21:10:43 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] No uprobes on ARM autiasp instructions
Date: Tue, 10 Jun 2025 17:10:42 -0400
Message-Id: <20250610211042.20522-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0063.namprd08.prod.outlook.com
 (2603:10b6:a03:117::40) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: e9adff71-8463-439f-d5ae-08dda86342f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n4FRajdhFrv3yjU2pkfyO8/8mMvZSDnwI35OjdeUtbPGJpXQLPM+TVqZy1Zu?=
 =?us-ascii?Q?cZZmy4jvgbBxj+6Ymsn56Q2WruwJgmgYelM1Sjl12InZ0MrHYZVwGOZDC1H1?=
 =?us-ascii?Q?ejiYZHGVb7GuoGaI+huh+Y8w3E4Ewhkr5ORBtx+WtybIcV7JyIW+mQl2tZU2?=
 =?us-ascii?Q?M3pJ698i3Ninft4jPn3at6VB0KIR0p+P26MTGaPTHvUhG0A1y0lriIbHizTp?=
 =?us-ascii?Q?vzu9/BRT1dzZ4ObSa3ELqoP1vVQ0yIEFYGnVSgNCcnsmUkU7X7OpTTVnrjKn?=
 =?us-ascii?Q?d5bKzyTPl9P2tvooPYElpPSVkSGGn2iFVGbCmvDoWGe6QnWtMfwK4bwc4j0K?=
 =?us-ascii?Q?o5mrZOBf+x/mxtK2bVYZx3Y0cRzNuyjOAifVQeU4vfoRJ792k5qCPGC6pMsI?=
 =?us-ascii?Q?nJGie0E1Bn5vdg6bFJ3qgU6//0fAEoRIlseuusAUHBs72vDcouCsIh+lklLe?=
 =?us-ascii?Q?aRqmeraaHlMPs7Gd7Nd0hBGduCKqGH3/NbboeGWsafwVabzdm5xq5cTGaA85?=
 =?us-ascii?Q?cl48nVo7OFFm85gUyd64SLPH3dj9vxt9ufzEJIkhPYG9cbBhguoT2GM6mpDX?=
 =?us-ascii?Q?tB+0Jjp/BOec5R607gUGjkA2kfMiFtnQUJkmCI+3XBbEtlOkgwt+NkOZIWe6?=
 =?us-ascii?Q?hFlxxGrADKcl1YsmI0Ua2/zddHmI6r917qQ+QQCEmEuZyqHRwcNLVQDfg2HX?=
 =?us-ascii?Q?+x02fWImWZcrhQigY13K7maSBjFnwDVFE2F69V6qc8az+R3wQeph6pdirEaZ?=
 =?us-ascii?Q?xO275pNl09EYnBM7/JDJwEcr0RMowIfTlxTQOFUfUjWVbCdw7mQ8J9JT7yhK?=
 =?us-ascii?Q?J2COUWPbqjn+9lxyBepxKAToi+kzhx+2npupy5CVXAUBi8UcoEznemaXcNq1?=
 =?us-ascii?Q?ypiLgdI5qoS7nF3Lzk1cHbKlVKLaBU9M9zJ0nHNiM5CwTpuFVBMTAkQociHI?=
 =?us-ascii?Q?iCZgGPGkCGjQKWc+4eZohxSViDSMaUzhy0ASp2nwiM9m5/P6v8lb9RN4PXVF?=
 =?us-ascii?Q?rza1doEMPy9ARIDG4kNq2uecYiPFMQ5S+ex91BZ+Sa4cBO6Z5bB5p/h8o3OW?=
 =?us-ascii?Q?CJZwnc2Aj8W3Yg2QC8wFlCsVdI/0hej0f5vUG1VdZK8xqESBfMsKXZ+O0pPy?=
 =?us-ascii?Q?V8XYymtdpM+Yz4CqvkfIGeLhWCcYR8QZARP5OtasEuKuncPBJpjqHrlAVLLX?=
 =?us-ascii?Q?//MkYRcwfA5232bKbVPA37i0zg41hdbA5zDCMn7Slo9OGW4MT2dBDGGZifwy?=
 =?us-ascii?Q?TJq3laalcTpMhu4J0YdGu1AnTsqHZzZC5/RryJ6x/181ZDDEN6H9kOG2rzZk?=
 =?us-ascii?Q?gfvpyyy3IV3JzzbZSR9DZoP4i5rDs2hd6GLlo/pJQseeZKY/2akQy8JV47Pg?=
 =?us-ascii?Q?GyIe3KeK/Ull6EuhfHLd1PVq4/D7gJAapbmWEltByK6FhekJAiYHpUq3J4cX?=
 =?us-ascii?Q?dahnhVhhrkU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LrD1G7S7uWM40+AtAljejj4ifaKL5Xzb4+LI9K5RxMVZcti2KR/dp4HJ8zm1?=
 =?us-ascii?Q?e8KWIXdqTB0o8lMIfsH+ftvUiPPsuoIC0HMMJ4afGYaPMLWE5A308ZVDxYNq?=
 =?us-ascii?Q?rol3ZvRhvzRidIjfSLH9QPkVT9z3KGiV16hfFgtkZcZ8YmunNpOQzesiyf6y?=
 =?us-ascii?Q?WJtt5Nf5LDaIO87yGwqCdQ1pzH0fv4cwNbggaa57+FHy2fKog3Clj4LxRt9z?=
 =?us-ascii?Q?4fCNp9GvgmH3N9p4fmbYSIAfFYlS38lcjJbTFYLHC2ESMV0kGcj2n00QbWzE?=
 =?us-ascii?Q?Ghj9IN3ECpRDnXRrgdTGb1CcwkuUIKQDaX8pmEJL7bp6UFcnsK7qADLTua75?=
 =?us-ascii?Q?rqQty7a8fRAD5UknIJ/DMvjRP186apstq5/gDDV9XF8Pm6IQhP8NQRXvNYSB?=
 =?us-ascii?Q?0lE+8yk9rtZnyCVFAovRpuDPVw9T3coMYd6ph+osJB0xbJKFegt0r1x3rcer?=
 =?us-ascii?Q?aZcbU4aShL2vzle+t2Ri0c1TUxpbET1aatjDxiQfiX44z4Tj6FZivrpqYtnI?=
 =?us-ascii?Q?HJ5hNNW6k6kVW+Wv22jateQSrb6ZN6Xv1gcRk25/zqMAso3kYsudY614v3Me?=
 =?us-ascii?Q?h1jxRuUsRoamEYyWJLDf0m8SiOIfsJ1Ek43jhrGzb3fv1aoyJLctuhr3hYll?=
 =?us-ascii?Q?JrWyOHPWnHa+1zdXPT5GebGAnx1lQnm1stq6TbnWJMsyy6lOx1BWFEpq6icw?=
 =?us-ascii?Q?DjW4o8EJN2EnUnwNMQHZPlhtVyb/yu8GuRB0aEphEBQLpRLW7r8aGlbQMwsD?=
 =?us-ascii?Q?/2YaOUy5bLeiS1c4/nKXQx2jYbsPZet8SiLVefsmz+woD99we938eLefeBe2?=
 =?us-ascii?Q?Yz4M1XSVefABoGkHc7MkYUpdqhMCVP8TqKBET4Cm3bTyBi9shO8p+AGo/Fj5?=
 =?us-ascii?Q?BpkXF6uNphMJwz0IgA30vSbJB7oh82fC9IZmHcF7Oa7lFThELSN+IDqwSIK5?=
 =?us-ascii?Q?X8b9Ry4MhuW3Vcq0arQ1km1oWSbVieCRM48VJmtKAxzLEyTdBX20nsbYgNub?=
 =?us-ascii?Q?Pe94R2Z6hjvd/qNJTSp+vccdqW/554c3WY1YuNWJzBxIwg6FDqJZJvav25r+?=
 =?us-ascii?Q?e6qLqdq9XFQBXsVxIuLaiCbKeDkNeu69EdWL4ORdQO/ykjGGUdLlSKcbBPuE?=
 =?us-ascii?Q?uzxTtbtzmMirpPTSMySKUur+uU2+n7NopOfrcJdDp7hdEd/TdDiJ1EYSig96?=
 =?us-ascii?Q?kcetbAex7ExT8uKHs5bTqKJSMemBL0FVxfkqChXxMfs5PQ2oPheWzibwTY/K?=
 =?us-ascii?Q?ntkQv5mBFA8jszNnLu86S+phwtmablRl9Az89QxvHmzAXZNjNbUeCMpifkYH?=
 =?us-ascii?Q?EA3NhoL3NTmotcYlzCNFoyaYVB2pVAPopHpQgtQ2VHZ+2FmKm2SdxQ72ieJ3?=
 =?us-ascii?Q?jXIFn1k6ga9SUk2H4+a9noUoftZ1yGcFumCEHRFCt5N/9u29larfYiRsWLKO?=
 =?us-ascii?Q?hdgCexxpYzQ2sTuy1xvP05LaMReFp+A2E3+NzYEoOeAJRl2QGnT8wWUxymF8?=
 =?us-ascii?Q?iAnX/CnDtkQY/8yToyzfQaFXTrBLpBkO6v+Q1gs2Ov1rfCHELNAx+CkyuRNo?=
 =?us-ascii?Q?PotIQ575U6d2BdT/4skUYUf68Wvo1hi8reK4LNW6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YEcgCuMsfVmaH6nqnWdjSVCb74SrN7FW84wTd+MNroXGzLQYViwH44CnU5EuOdbylAd/dcY1IvONH8vy4Bv4dUe6PF0YH3ho6BljgdTmQDfC6m2YF1ZN99y+hWj+3oWrSpakWfSbnhGs2xLuPAYsE4WbIa35U5x/EZEVL8g2M4rvC+eXr0DIc1YcgA3ES+a+YfeJPrf0eQJIflf/6/AVlquJ/Jd4obppOEqjB3MbiKqCO+5ot4Ab35NF1RQc/6Wq0svs8yQ9iFXafQajn5ymsJBPvjC2goOk0189OUqP2N1ft4gONlPXRKSLHZXVRVZz8zm+sKRsSJLBXAsZ4F6qFDBBe7G6lj+zonduoMbvJ32STQB1VLy86m733CmnqzrqJEX3wE0dL6vzkHsb804pBmqHqgqkOQdl6nKBoA8FTJDJnyQDdDutbcjFzoLErU7hXc0jYHxVvstkW/qdEf84zW7ARAcIbcbdFdGZqjV47a81PjtRqZfmyU+3tDWSYxyLdaNVvgkgvkNNIBVeYheOUo4VBCjzQ+r5ypJDqxNKmrK7yyRO6o8v7UKUiFOXj0deXzWElRejr39ke6oj988U3HqIiS12ngryR4bX/ceAjsA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9adff71-8463-439f-d5ae-08dda86342f7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 21:10:43.7522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0v6tc4hM+beAevV9eOS1+wUtOHU8LJIL/M1QwYtyrI6R0kTVpcBEQ//45OPmtTT1AWpbhGXOyzq4GAXEf/ylQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5616
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506100173
X-Authority-Analysis: v=2.4 cv=LIpmQIW9 c=1 sm=1 tr=0 ts=68489f59 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ApSHVUfd5jOAveDjT5UA:9
X-Proofpoint-ORIG-GUID: RxVdQTuMpvTH8rJ6_X-MfJjdBzAYzK2-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE3MSBTYWx0ZWRfX9JpCqUnrmgLb HQcoOZoSYuLuoVoWUkjozCEviRJjRCXBcIwIlTzpHPOfmndJTC2JQQRL+4w6XXKfM/i6m5c18z4 AjulEYFglB2I0JL4zyZqfSa1DRAzzHCGLKlCR6EVGJ/yzkKtALLkRLPGOlhuxf25c8K9RyDy+gc
 8J2Sim4wSCL2S5CJj9jZhbLQ/BjHyflaJEhekm182L3KuoXW5UOvHmvRMjczCAoIIgdZNsCOjrt 7Iz1HjZxX2NZwG7NAcBUoGuAI6eqwuTz/CL31RDHt7ZXiWoAiQgfD6DJk7T32B76K8u+djjVtLY RZw8/zAU7+QuL+oDPQALUILMW95xPV2y94Q8NiybYyvsbeNOLr60Rw6wJP8o7162YhkBi3yxzmf
 2mKLBxeJAXkEeYma7IxuMgnHypjrzJ6KUP/PZ3qNfwnAjE8BK3/BIVRfhWZ+LXnkdL+W5hnO
X-Proofpoint-GUID: RxVdQTuMpvTH8rJ6_X-MfJjdBzAYzK2-

From: Eugene Loh <eugene.loh@oracle.com>

New compilers emit autiasp instructions much more liberally.
A test like test/unittest/pid/tst.entry_off0.sh, which tries
to put a probe on each instruction, may fail.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index e2d4e540d..833e9b647 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -279,12 +279,17 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 
 		nmatches++;
 	} else if (glob) {
-#if defined(__amd64)
 		/*
-		 * We need to step through the instructions to find their
-		 * offsets.  This is difficult on x86, which has variable
-		 * instruction lengths.  We invoke the disassembler in
-		 * libopcodes.
+		 * We need the instructions for two reasons:
+		 * = On x86, instructions have varying lengths.  So,
+		 *   to step through the instructions, we need to
+		 *   disassemble them to know what they are.
+		 *   We invoke the disassembler in libopcodes.
+		 *   (On ARM, we step through 4 bytes at a time.)
+		 * = On both x86 and arm, we want to skip certain
+		 *   instructions.  So, again, we need to know what they are.
+		 */
+		/*
 		 *
 		 * We look for the Elf pointer.  It is already stored in
 		 * file_elf in file_info_t, but getting it back over here
@@ -298,7 +303,6 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 		GElf_Shdr shdr;
 		Elf_Data *data;
 		size_t shstrndx, off;
-		disassembler_ftype disasm;
 
 		/* Set things up. */
 		fd = open(pp->dpp_fname, O_RDONLY);
@@ -344,12 +348,14 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 		/* Get the instructions. */
 		data = elf_getdata(scn, NULL);
 
+#if defined(__amd64)
 		/*
 		 * "Disassemble" instructions just to get the offsets.
 		 *
 		 * Unfortunately, libopcodes's disassembler() has a different
 		 * interface in binutils versions before 2.29.
 		 */
+		disassembler_ftype disasm;
 #if defined(HAVE_DIS1) == defined(HAVE_DIS4)
 #error expect disassembler() to have 1 or else 4 arguments
 #endif
@@ -390,6 +396,11 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 			/* Newer kernels do not allow uprobes on "hlt" instructions. */
 			if ((unsigned int)disasm_info.buffer[off] == 0xf4)
 				continue;
+#else
+			/* On ARM, we cannot place uprobes on "autiasp" instructions. */
+			if (*((unsigned int *)(data->d_buf + (sym.st_value + off - shdr.sh_addr)))
+			    == 0xd50323bf)
+				continue;
 #endif
 
 			snprintf(offstr, sizeof(offstr), "%lx", off);
-- 
2.43.5

