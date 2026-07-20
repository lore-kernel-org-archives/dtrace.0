Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4CF43E9C5
	for <dtrace@lists.linux.dev>; Mon, 20 Jul 2026 16:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565246; cv=fail; b=OML47Mg1fCsMS9+tIdqPtoWfLeDtFPB70UZOpdE3a1wN4nzQ8LBTMxZJ52evoEVdCOQSaggGaPbrpMS3s9C5uCpNIq7yvNxS/njG9twvpsVtWtrvG4jF1vOsjx3WdylgxnSHfNktjcZkbaUPzKAH3SWf2kan4CnOp1mEQWaWXC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565246; c=relaxed/simple;
	bh=Pvm7E2s/9UACOE9qnNTatZo98erZvI02pBlmLk0yj+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c6EDdVdlBC3yRps048pd2v/DTGnrO+Y6oliOOt61XJMeR1gj9DpqDHKMKEaJu6NZ4XyshdjwDUWnsOF4Ahy0I/3jibF6q61pvC8T1jYzFnv8+2DJolEL4RiHlfr+5931mqSYMBHQSJu7FYs7T2kXRjR0VtwsjpVFKNZ2oIv/BEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R3iDPGq5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xcQOyvgI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R3iDPGq5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xcQOyvgI"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KBjPm01777174;
	Mon, 20 Jul 2026 16:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=SJGAjl0zUOx9GMKbGy
	LE4QHEEYp+/cijie4lsWMUa7E=; b=R3iDPGq5YP8NkVyYOxGKRSowLHCDqM6i8b
	4BZA9mTY4tLJbMqiogy1p/AZDc1sK8o928Q+NQeYI2Q0uf1n60/HN2OBPeyswL8H
	RwhiM+hsLdJ6jPrdSnS+dU6HYLe74AGV1sSdfLRYoF2vUsCJaXkftCVex9vzc9ZP
	beQq3BquPi547jaqY01cX0PIdiMHAONgBzVNmR2HQzfyWSROWPz7HCG4379TDL5e
	015TYWMDiALqyfFwdDiQZl7mbj0/P1VmSgJjFereo89/Pp1Gow/FuWPP38HuOGBf
	VM3ezyH/JmpDrRjsRdeZkQqGr1h2EixnKfp5GNFHFz23B4c5jfZQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fg1n3j5g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jul 2026 16:34:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 66KGXfi3037774;
	Mon, 20 Jul 2026 16:34:01 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012037.outbound.protection.outlook.com [40.107.200.37])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ffyxnss49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Jul 2026 16:34:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaVJPxcA2x1+mbqxaOf67k7WyiOWvNzVxQ5ouy4I+dlZQ80yoFebY+2DpRHp65LI688/BphK62hOXfrmlvv/PMbUAVd/im0S60pZvUkABFT5AyMjF7CuG0YgO1jGIgreK5XNkuc/wirKWZUwZwP/askr88X04i7eDcvvIC3DG2ktwILSlXzzeGZ9VzeyHZwfCkOgNUR2U7+BmbqtShhm6CwPY3C7ykFPA20p9hJx4a8N7giLLYeyapJ8ou72+0gBUFeBuvR1lDrHHKHgq4lXZ30fJDu6Ptbom7vbX4+RhtvfSWxGpcypJNVvQXt6uERS4Y6ZDW+905wgf20wjv2r4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJGAjl0zUOx9GMKbGyLE4QHEEYp+/cijie4lsWMUa7E=;
 b=EGJfFhxlXwnOsX1pvNem6k7woWwJtdFpWw6/ajXirGXU2bWCApSIgOA94CwvRKZFhakJ3TvScdwOr86mGxQUSE8f5LLBT2Qda+ALttsSo/lfx6TEUt5pEpHZ0gxHz0zShVJ2F9RY+3ZEEgXn7zIRxd+30ZstXdzlDyCum85qclR3sn10EbctpuFvckMHjRW74RnyJbHdsutt8aiyzxcpdBjD17+37ZfzcjyEI7uU/3NRu4k1uM3x9n3ftvknqR+eRLe46AhQCGHIOCLBFPwuroWDe/P4rbUPS46wlWIu+79BRNyuFQsmlZmX9O68kpSO2nlrSnSdg75yb2xL5183lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJGAjl0zUOx9GMKbGyLE4QHEEYp+/cijie4lsWMUa7E=;
 b=xcQOyvgI5gn7BG7GUPf0S8BROakobmc3WELWMoeJVaH+niUBoms4u7/LjekjQ0F6F74hCwQ0YNkx2tGjlCB3tb4PBT18rZRGuTKAdzgTZ0ihdqkvnc4eHERd2zAMD0jDZ4pDKhdr5VsDDU0VakImpNeRStuk0+3g8+vhGpt8INE=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by LVTPR10MB997841.namprd10.prod.outlook.com (2603:10b6:408:3c3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:33:53 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 16:33:53 +0000
Date: Mon, 20 Jul 2026 12:33:50 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Jacob Carlborg <doob@me.com>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH 0/3] Fix DTrace on modern kernels and in containers
Message-ID: <al5N7owh36AfStjS@oracle.com>
References: <20260720133100.77573-1-doob@me.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720133100.77573-1-doob@me.com>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|LVTPR10MB997841:EE_
X-MS-Office365-Filtering-Correlation-Id: d22ab284-96c2-4515-4599-08dee67caf89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	EgvrsZ+6sntqhKJoNlq+mHBeLaBCRjt41jKV2qGo8fV+VkOmvjO9IdSmgfzQ2CAeIvYFj/s32mevesZ9ufpxiBLC4qTjEUymXyBPWUjNBO5zAbNS3CxUtJrvqtbeCOEsLavVnmjtdxG/cWfT5SNxwXBH7TTE1xIJ5vWK5boO0DZDV1f/KGGfzwvfHIxiZFRLyF/gAmTsPBA7Aknswzj6eUAAxw7j1iVb+4hdcO0WxhXi3RrALTPdgfwzNWSOee5f3lk6OFv4INdR5feZza2cH1Hg4PTztepSEsthnAgfw8LvAckxLLnIP2C1eXcHsqPlFqa/vFISSmjgQjnhlzgKoKLaMKStcdVjuj/C/xdedf0cS7X1i7A4mK/w05FWRSQYWbDFpSUNMEu88We5p+CYSf7m82+TqoG4K40brfTjajKL74Q2/vnMYomALEsNR8J+jdNsdu3hctUEBjcmc8eQF5eDCbFdswvGEVWMzgg+AHgHCtQSMWwPIL98P2iTPmibGUfh5iWd3qG5uKVdxhYGS81+uKBjZJhlAFARS5D+BouYtdHMG3fzC4/ewNUflm68bqtWp/LT2xCiVIFBabbvteEYJ+sWcUE95h3fKILUUxir05C+aLtkz3YRl4cbfBFvcGqWheWaV63dcHMqFkoF/Tmed/glfvhHIQ0l/CVoCnQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cf+wZm4cjIBk6P59wKk34JJzfnYmaBWn6CSdkvACKy+i5CjbeLmNHhMoRKg5?=
 =?us-ascii?Q?XxTqGH8HsK/iRPpnBpHCE9YU9RLY6tmakzHckRAUx21mhCLM/L1WAaVSfWai?=
 =?us-ascii?Q?B7PWI4PsFup4kqrEMkMVCzS6ehIl8rgrGOUE7BQ4q9B3ZJlzGcqF9bU10wQZ?=
 =?us-ascii?Q?aWq8OSbU/DGmgXE9VsLwdlWwHk6lvgpCdrgOWMLvlBBwIS5fc/c4DSRqit3n?=
 =?us-ascii?Q?h5LlWjPD+3DzrTKWMNQBF17Z0m7KBH3SxBS8AM1lfK7buXV/72dYQWzDAcaa?=
 =?us-ascii?Q?yRFT33HED25/sWS/oQYuUcD0EgHTN3rI7+2DD8S/C10C5txLV+KwBVbUoWp2?=
 =?us-ascii?Q?A5yJn6y/xAkEz7VEP+V7OWRjaldT6nNXBX9PwXN8zlpB+4bnXXDUL5s2lI5W?=
 =?us-ascii?Q?NnoIzY0QBEO6mdO+y9axdDQEaVqgiLFqP2yg3QPDndspL9HnbGCSiJpno+oK?=
 =?us-ascii?Q?0lFafzYDDzM0ydKa78yUpwxWr08Newr2iCL/YMtWmwjChHQLqCklEse4ddQO?=
 =?us-ascii?Q?1g7iEDrG2K/CD6IwazAZeNLBHvs5FsrTIPRuXPAdwSNkkF0foajYB48E5WMe?=
 =?us-ascii?Q?GtFOKqt6amHlpF4ody6Z98Tq8bkgO9oUc1VmYl4EeG81xwF8CrUuOlAS1vTq?=
 =?us-ascii?Q?1FUUbqHRtnQ9gra6lYP1el4VMYruDfumNxXdiXgRUBc5Xe1T50UCH5zLeNHM?=
 =?us-ascii?Q?GwgfrpKtdF/6hifrQ0xi50cWA7eGhFWSnNu/DPfmdus7LdDgAwQmVbXWr8vH?=
 =?us-ascii?Q?OI/htFEScd3aqUIYzl4p05TzuBBeZPW+yDDU6hjkAFN8yVcaW/1vlppvaFu3?=
 =?us-ascii?Q?7sNQ2UWYalkHRXK6NP+K4x2RI0gx9QsUBWAdnVpIdcWgP48aaWw8aNeNenyz?=
 =?us-ascii?Q?SFZdu4rcStkQKaAIAMLAgKgW+YsOD1arm6lT/I/8M6p/V172Ui8zfIAMbhGl?=
 =?us-ascii?Q?/8PPg6hP9ifHXyhT3dQRaN4gWEqrX31m6VysQaQ8oTjvVHQyggmfKJ+AqFOX?=
 =?us-ascii?Q?j9nWO4yn/Oxwzw1n3loEoeSVfpPzeReaEJ+3xUf1eeGjTFVqDLHOy5cpC6Up?=
 =?us-ascii?Q?efSRK82h8bt72UWXAWDeL3/dAuo97ymIe/Ka8nF8zSauQJUPjvQi0bQ2tVfD?=
 =?us-ascii?Q?0w6bci5gCDQSMt7QcgVYG4vIiywU0y9nT1m03CItqff+tO+CYK9vl+iGZGhv?=
 =?us-ascii?Q?Z2HSxRnXnB3d7fqatCg/8eJntC91alsBtgYzeA5hEO6PPeqQuwRSQstrS4o5?=
 =?us-ascii?Q?tfUig1NdbSXbcUWkz8/jhBkrEoy8KgsRFsVAhwnJfDkOAWmHjNCmVsIKlZf8?=
 =?us-ascii?Q?cEfXyWOHQ0O6asciarOyF0g21aNVZZKoq9wv75zWOVvmm7XNkKzvXBe1d9lD?=
 =?us-ascii?Q?KanroEfqHlbBzlS8uQ3NjyPsIUABxri7onvU4caJ3UD41Xvv2JhgLnJLGbSe?=
 =?us-ascii?Q?wv7+tG45mgYALk5lT7OX/9CuLFQeqE23P2IBeGFoojhpS0/1cKvWqH23lQ4z?=
 =?us-ascii?Q?6cvOHRuRPz73ouI6AFU8Pbxj2RprnsQ1BckdM1cEq1Vshmvf7JJiTzMrBJTr?=
 =?us-ascii?Q?FZbHbtrBXc973/6iyA4IosL6PoVal/jmKzDw/UEPSZFq0KTYjbN/ABf490tQ?=
 =?us-ascii?Q?08q8mCbukqtVmh7sdXSG7UWoMMx+wd2vnt5q6k0i+nVtFE/jxz0aZSho8Ys7?=
 =?us-ascii?Q?1uJk8H01GgT4yqV62Tc0j+80IYRKYlbtJaegfTVQrIIeXrjQk51jz1mdpA7/?=
 =?us-ascii?Q?LIPrVPWHBg=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	R5qM4TNzWsrpKWGkH5ZgE7lldLPNXJr2T6lzEsjHMaRPDw0sKkA4ZBYY0QzwfI8/F4Gqx78BwGEw0uYKCwQyvTbHlIn1vdYZAl6hyKW/jA6xSlFdMIStg0vdBOdqlS3nd/J7Uiageqy//bZbGO/SDnOorgsdMj+/QsTb9ilCt+P/CFr9YhGhfFfQ/0/Nt8D+3kpnLDZzsovFsL0CIs8d/7PayPGKAePN/0xb/GggMdFoSV6ofayKUM5m16ekC2fkHhb6JDWQVItn/msaxlfcHthMx9iLejPAuJDcWjudTvs1wcAUBSHjCqCVsEd9/OVonVtFBlKUo8JzTxOCJkWLWw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aXWL9qFuWCmp0HIW/2aXB9WT3BdkAbw4aA+vhLaA29OTpVVUdFH19jBniCqRgou4d+RUs1qDBlIXO3UcRYRxS0LyRUMihy8HJNCLx20nJHqT1JwFRsomsEErF5t9MBWOivIEYyXJH/1ZpghPcGyntBuKLrWFUmNqznTZfwP0YXp12LMxAW1T9omOWYbKhNmoiqI8lbLlfDib9aA8K7kjW5XVvJRm1L0ucV8FeJ3qA9i4OhxYOkxqVFWZSAgA99+vPM4YBNFgjv23spYw653CpMDZdM8Wzvu1BUjeKw5BJQx5kuwSBC9YPPFuw5yueMZSEkHhPIB31KBxogZp8XzHqjS2MnUB9hCOB2vRHYnvpZCDFN5vbMMy84Pa0j1luY8/KY+SL7hJjGKovjEXuV1oEfkUoCWLKiDPKELe2YFtGBiaMSY9hPiHE5bRzmsIFShTS8k5bxq1o//+YVWI1lAkejQOv8H0xIf2AqBGHFllLNjmAp46CkZ51KWgNrBYpWiPIIyS+yRgb769KxUNx1xQXY8omA4v5ogCA6OePYQKPvyjkS+9BWLx7ENeH57GXYlcSvZGgA9kSNJnWXvwm6zWFRK0wd8dLvEdOqhRY9ONAFk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d22ab284-96c2-4515-4599-08dee67caf89
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:33:52.9797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LSb48Q+BPcDlTp+YvOgl3jBz5CBcixrOXkMaOk9Ijghv8afwEbXHEjHUlEsYKdwwE27G1Z7UvJDbA2/MU8uFo+me5uC/DC36lvgOCiC+SE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR10MB997841
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2606160000
 definitions=main-2607200184
X-Proofpoint-GUID: fjhiGcFSAME6M-k6RMYmWH7IKzCTL-Dm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE4MiBTYWx0ZWRfXy8190QFErQO0
 ug6r7wkO1eWpgSEsfmW5lIh4YZTracTGOz86bUP9QpqfidRH4KrJNPcPVjU6gEFDtaBwAJmhh2K
 yngO9OHMF+IVikylo1hp2JyfC7k6pVnqpVogQBrPG7BRpS1iIl8D
X-Proofpoint-ORIG-GUID: fjhiGcFSAME6M-k6RMYmWH7IKzCTL-Dm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE4MiBTYWx0ZWRfX5cfhIAxq1MWz
 M0vyTI1VeYrz0RK73fy0nwtXoQDnTkdR3AMRL6/e/GV97GmQTEE0RLpIP9pBOaqN7KDXkYFnUWo
 s/D4Sr70f9wqeK+s8ABlqEUwS3f25fZ/V7X2ITtPglehqzLF1B+eYlBozYJ7ZpnyZgDiLWbkvIZ
 cfoQTA1mFAEtcpW+2AaEGIfRJ3f5oWBh1jDnVxMNL/N3yt+PSwsmLXGH8k2XDwwU4/WFNz80YrW
 KqWQx2SkpLsAnVfyuS7srR5vU55NSzGIwUxYUabgZOg4HT/BrYfRtF/2B9o/bdTEDwMWnWEBSWP
 3Axyj0Z9aj92K1HjLFn0KMjoFY8ziG1n2H6MwYRFqHlsq9IDvaPBx9/rRr6Bgwnvvp1Se4Obc4v
 6hOeKA1LKVaGw7ELhrjDjdKh5bxI9Cdw38um7scwhMCO9aqp4ty2Sw7mNPQbbYu/fjsORwqfRSV
 gk1Tpab+PgS4qHt2Ggf1PmSnR2W6E4zqVzZJoYZc=
X-Authority-Analysis: v=2.4 cv=PryjqQM3 c=1 sm=1 tr=0 ts=6a5e4df9 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=_z8jhhpqdpSBn-l6r7UA:9
 a=CjuIK1q_8ugA:10 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf
 awl=host:12218

Thanks for reporting these issues and sending patches.  It ceetainly highlights
an area where our testing is lacking, i.e. containers and related namespace
issues.  That will need some attention as well.


On Mon, Jul 20, 2026 at 03:30:57PM +0200, Jacob Carlborg wrote:
> Hi, I've created three patches for the issues I've encountered when trying to
> get DTrace to work in my environments. One environment is on my local computer
> running macOS ARM64 using Docker through OrbStack. The other is our Kubernetes
> cluster
> 
> Hi, I've created three patches for the issues I've encountered when trying to
> get DTrace to work in my environments. One environment is on my local computer
> running macOS ARM64 using Docker through OrbStack. The other is our Kubernetes
> cluster in the cloud. The first two issues are differences in the Linux kernel
> compared to what DTrace expects. The third issue is container related.
> 
> The OrbStack environment is running version 7.0.11 of the Linux kernel. The
> Kubernetes cluster is running 6.12.85.
> 
> I'll be honest, the analysis of the issues and the patches are all done by an
> AI. I've verified everything manually myself.
> 
> Jacob Carlborg (3):
>   libdtrace: resolve BTF type tags when importing BTF into CTF
>   libdtrace: derive io provider dev_name from the device model
>   libdtrace: match BEGIN/END PID in the tracer's own PID namespace
> 
>  libdtrace/dt_btf.c         | 20 ++++++++++++-
>  libdtrace/dt_prov_dtrace.c | 58 ++++++++++++++++++++++++++++++++++----
>  libdtrace/io.d.in          | 17 +++++++++--
>  3 files changed, 86 insertions(+), 9 deletions(-)
> 
> --
> 2.50.1 (Apple Git-155)
> 
> 
> 
