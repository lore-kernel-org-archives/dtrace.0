Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C7D2D8788
	for <dtrace@lists.linux.dev>; Wed,  1 Oct 2025 06:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759299872; cv=fail; b=QMgVLqYiNeNdgzoDMA+tk+hf3z4ZpU0jdtUz4LHHFX/Nvs8gjfaqZqp1FpSBjfXWexX+eWEvqLwl8fyLnKkdpTlFEiNdYKHVr3bVdoQYklurguO8iMO8t5EC1TQiVZMpQHA92tMz8CSfCqhj8lDyNHo8K4SdJ1U5z4DQl8S4OwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759299872; c=relaxed/simple;
	bh=kyJMYIrCqtSUWO0HcCXHiJemqvHc+x7ncaZY9eY8gIM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I+kENc3/lv18BXL9KzBSTyEfFJxvuGoMjvzrEQuWeLrr5Bj8knllZls+mwLinijAzsJTZbntg8e100WxM3qQmfnXNBkgogniWfDO6xhUUO9st6toeyxu5UzMMuROQCCbfqPuOAwx4aqPhFeRwmGiPFqRGRXP0kkmjR96jevn634=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=arOWttep; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yEWxQ5Tc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="arOWttep";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yEWxQ5Tc"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKMqHr028242
	for <dtrace@lists.linux.dev>; Wed, 1 Oct 2025 06:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=x1hDTjFSN7x96gUvDU
	m9PmtMp+CzGa9Yqa4yCYFeaAM=; b=arOWttepaSACsuBCaKdx4NEwoMovzxENP8
	y6tSR2yD1bGKY98EcKax4RcChg79w4cOT1/7GcbCRdM6Yg2/GGQj296nkeAnKHYJ
	hvRRvZKNuYEe8H6YI7mM/MnY7vUhiWJ1cci0++yBQyFw2uRSQookyUPYniZFQgbe
	3FzjwjAahXQfBefLnc57AoskyvlDNyaGLCfVJt4Y10ziabaC10DNeLPjPzkO3zTB
	tPEUVdN+51koVuAsshWDxMZIRFWt/YbCx0wd/c8EJI/PHvdrRpPTQdvD5f+3QMzE
	VfAHZlo9fegxd+9X8py+2orr8UhK6XH1MgLAxJRQCfWpFRu5YtlA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmf1rt2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 Oct 2025 06:24:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5914wOwm007732
	for <dtrace@lists.linux.dev>; Wed, 1 Oct 2025 06:24:28 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c9tgxr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 Oct 2025 06:24:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0Yv5/CfiUJWzm10WMHT+YV42zCL/LGIw5AnsJJo5tHjhq/PbeXbthbGgSY6LlSfSNhGd140jf10iJ8m56LQftg8cc/SSk2E07/1Rcj/VBqdVI316um74XIWgt2sWZj84NrZk8l3XZRzp0DsPfbTPPAHwBEodh691u6I679/JIjfwLVJuif93ahGht108Ht1aatuDRlDLoZOAKPUl6+2RE4qBd7Beb4/Rgkr1+PN43k2SsO6QlmfljbKINDTFZV3FHaagBIDDssBnARgw1hZhiS7nPHZG2lLGPaqEnd6RNYjfChEDXzk9CFKwDS96XzF5qlqkalXv569jpn6qlAvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1hDTjFSN7x96gUvDUm9PmtMp+CzGa9Yqa4yCYFeaAM=;
 b=HJW+UDk9wgBAFvOHz7MvFItXMPwLV4oAnew4cXy00eVu7iZKAQhMPd0sD0IA2LVKLtWtEOYnVsTGDtJJAS3sun4X4TeP5mbQWsLuZFIS1Tb9+wFPr4znDU0fc6jsY5xsjLazOcoTpL3HKtYTr3dBK+pynzqaygR9suDDaUV1f3zWFivdcGViWH+IWgaoXg8HLkYObQw16AqMIvImFYQtWNgy7hz5tfAg4QuBHVpR2ufFfZOUI1tYvObNko1OOQQcg4NaRooMN/DYa44weQhtpSRoIms5i/KsUmy3Zem4npi/HMsT+JAbxjVYCNz749FXpOBT+fcRAD0jG0R52YheJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1hDTjFSN7x96gUvDUm9PmtMp+CzGa9Yqa4yCYFeaAM=;
 b=yEWxQ5TcHS5+G42N57pim/+2kv4CtGkv3/GLLdMcHyzK7WvII7ZldDZ8dAa4e7Ykcdjoz3IuF0ruLmtT0vm4/noRBJvkFzvLfpx4A9uWpcyUb38jeOrn/Eidt4yIv+hZ8q/tVfYQsu3zgio8ckviLWLrjU0l/uEn4sYXh9H3fWA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7078.namprd10.prod.outlook.com (2603:10b6:510:288::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.21; Wed, 1 Oct
 2025 06:24:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 06:24:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/5] test: Fix antiquated reference to dtrace_ustackdepth_max
Date: Wed,  1 Oct 2025 02:24:17 -0400
Message-Id: <20251001062418.6902-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251001062418.6902-1-eugene.loh@oracle.com>
References: <20251001062418.6902-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0064.namprd17.prod.outlook.com
 (2603:10b6:510:325::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: 04afb6fb-0516-4e5a-96f5-08de00b32b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rwMvKKv2J4VpJE8GzolbSIvpB2qDvqgUQP0k+qyAGovvOUzVYkPjm52GWrRO?=
 =?us-ascii?Q?QT05KajRlp5IuH3MFtACSM9juWV91yLURfsjawbm4739dWHTVUq14XjbfTGq?=
 =?us-ascii?Q?MF6+GGdtZ9oFzqYtqOrPS26rtEGFuU7tgFqTeb9Ue6bS2bsnKWAmIEKjTOkW?=
 =?us-ascii?Q?rTjSroTlNyZGUKIaoetELzLbUwzOx6+AbJlK+PavuZuinCCOXBdjHIOtLycG?=
 =?us-ascii?Q?WIJnXLE2J8epIFyj25xLGHlTNPdDFmCPV4PlJt+SmxYlOfd4Dx02xCHJMtqd?=
 =?us-ascii?Q?FvHjnMLtWYrgiqV2M/Rm1ShtNvkPgW4ZaKfWUrbYd+uXcywgDiwpW2ySQjb1?=
 =?us-ascii?Q?BudpHXo67dmY+XDnX8eajSsAXwh92VOxe0ZoDsRzSiic1FDQvrHt8erqqp5e?=
 =?us-ascii?Q?WQICI1gD108d+NLinhKu2FxiJWxZ4amRTYaUwhnjzU8+7lvVK9JHmXEI05Fu?=
 =?us-ascii?Q?PRwAW+HFBjr9/BeW1A6YMo2SkZe3dmBnwrRwYS2YO2XZ2d7itHrMl6QmfBsT?=
 =?us-ascii?Q?2IWOeb5Oh1eZSy+zDwaFDrUoys2PyrNl4XOypNjnVUOiGZ5+ZklQlv8rqjr+?=
 =?us-ascii?Q?8RUiAgpw0fk2xO8LCkRjLKbwkmDzpqn599uktm8uVSQcf95cc8OPQ3DF4uKO?=
 =?us-ascii?Q?9e6G2o8tU0LwPbj5fUSgrz0K8pl/7L796sQkevfbASuIyRFjrLBpjPnHJPbV?=
 =?us-ascii?Q?520LzmLsu0zL+3g9/EHBgjVstAVxCnoyvS2epud0veSHK8aLR/KI3DcvJ/RW?=
 =?us-ascii?Q?1DFfHDrr4LCm7TkEGESuEv9/nZZz/JteOMqClvmi3v9aGB/gs17AEu4AoeNv?=
 =?us-ascii?Q?U0nTCb9ruxcJItuTNA5J1xsUrJefR3ZWuFaXnp7MdyWovljSZkrE0oNhHXQR?=
 =?us-ascii?Q?15lPVsnAGqda/0fEO5X9lLlF0xivXkZxrq+CDPZHWhdHsKOZ/QNFY08MlJV0?=
 =?us-ascii?Q?E2C0HRKKx1GA/m43ixzW3bP0yMonllzJ/7cnvBLZ4u66k+GGkXC3672yiP3q?=
 =?us-ascii?Q?ja+Qt4bWJf3JH6hTmDPMxqdplrIzBls4RhRsJryPunu2Ydjm/f9DfO2D44G/?=
 =?us-ascii?Q?5vhc8svoQqm2KXbRnBmdeq6WxIn/9xNS0gtxhAG4F0C1Rgjywh1rwnzv9gSL?=
 =?us-ascii?Q?pChdFEDQgDC/JH6pdfUgtKmu84y7JxXtjGpnFLosnDOe9osr8z8zd3+l5s5Z?=
 =?us-ascii?Q?YrdeUHFh9dA5WiGS5KTHiMMuxj4bbFcSJIKFquHRm4VIIU3ngjRhEtg0FCn5?=
 =?us-ascii?Q?r3IbZu39npZEypulcAGmautn0mf5jXFR8zNZnPWzk3Gc827S7r0mLdWiLR1R?=
 =?us-ascii?Q?PGQFIPq5xz0qmU2wAMST6bq56Sn+MqQuTsvLjarn26F3R/OvdSgt9NrArXMp?=
 =?us-ascii?Q?6NezlsM6dfYGoS44RFJ93Xihdc9SXSnRCR8GziBSQMP3wNZJ4M1VHzZEN03x?=
 =?us-ascii?Q?xvKJ1yRCcwsb2uphQllAtTaUZ7OntSY8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n5AmjEZqo9D67R+fmI0Vxl1kd+mkPZQWUim1yRssdCufoNTL28cLM8q5nFHt?=
 =?us-ascii?Q?YK8tpdFNmDEToVi74/17YsmVowWYTzNM+KugGsSmJ0/FxnY/tQaNA+xKUcAC?=
 =?us-ascii?Q?/Vst/agxwnz8Flz3ZX4rcqCuIo3bdfYJoCR9oPVyEzwzuBgd1Hw/T9wOE/vT?=
 =?us-ascii?Q?avOMBYt2rR7sHbXiSS2EXeLCRE+LciUaJR5tL3wxAAn1IOkxlZnwph+LcuyJ?=
 =?us-ascii?Q?8vHxtx9tODmKVw0QvQ8JaIoh6rwsEEdEwE0OVMKU4AbmakyFSujOVlyLaj8x?=
 =?us-ascii?Q?3n5tM3wLZ1FnO92LhxljHrC2RAnvNPXvz6BlNlfXoOusuhzW2zpAIpEtZHKe?=
 =?us-ascii?Q?Cn3l5gWXyviLCLfB9thrGrFREEw9umcgy2hcM/FN8+TG0p2sdxycebz50aue?=
 =?us-ascii?Q?pEvLvKHRFJYKJr7d/DM42kOqHAomktTD5V5JJznv55ukTAHBp4ehJtnm4S1A?=
 =?us-ascii?Q?DQgI9EJyJiKBSiprok+g9LevX3KvvxQTtfux96GeE/sL/BT9maDIwjtaZYpR?=
 =?us-ascii?Q?sOjcyc25Gtc5GjgEX+gpaf8vj7L7lY2MpYYbty0MghFJ5P8EC+aw5eaQywjM?=
 =?us-ascii?Q?0rsjUY500DPeN0vILuTMvz2DdoudlI7kyApVrxjjQQUMFV6PsyqwNBI9Rb7f?=
 =?us-ascii?Q?UsyvoZ6Divc0dM0HoEcQUKpD1LK9uW7nIGo+VwhRRrSv25plo0I1yASOu+Ug?=
 =?us-ascii?Q?s3cB0KGZ/riBFwf47V6qdvzqX1BGGbjcHDVCrDvz+LKv/ufrNAfBYHTqhzYj?=
 =?us-ascii?Q?GP/ag///lUVpCWf4GQMgE1Cro28ymjuMMd235neGYvj1NV7ALGTKlszMwaP6?=
 =?us-ascii?Q?J/sw8STNMjtlEYus3ExfYqfk+8hUzWDdUT69yJmTg+E+Jo9ac7JVw/GuGJyw?=
 =?us-ascii?Q?5eXe8A+livwsI0HBN9i0UNNUsmyR4+tbeLtjEeAv55GlUdVMUqFDhti03Uls?=
 =?us-ascii?Q?NfZZQjfqXXNGg9wbJwkK5hrOoxap80LN8CDfCT9IrfKN8CbrAy1Vf4qPzqnM?=
 =?us-ascii?Q?I+yjCJrRaPFeneUbcNzaevtQC+AreAtpGzxTVcXLnbXM7YAOK86qTGmf/1X7?=
 =?us-ascii?Q?IVwJNBiLI8jt9/BIEDXRQYKHgeO96B29koUxHaxo2D98Zl4cK/pv0sECUKOj?=
 =?us-ascii?Q?m+x7sgHvzeCsW1bhtgVHvzQC/dCLA/uX95eKv7scXjbd8ZSz2bM7NZYXJQyR?=
 =?us-ascii?Q?S08PjKiNr0WudJzOyjGmAGBLPLQ67BL+B7e7A7i3b3dbOy4WsMD32gPPBQZC?=
 =?us-ascii?Q?wRXBwwL70pejcWbLt7wrM02HyDQY9oYbWME3rcq1vyQxRx+KH/+bhOSlC8qe?=
 =?us-ascii?Q?bMnU3dn06CVRmPCEf2kcDK2D2uhWhob/XICMDoqlgAlOf/5V9aaRilLglKSB?=
 =?us-ascii?Q?8RXNT7hKrBEoLRym2gOH87c41JdTdpIqWQwvTB/PTNaadIU5Cb6aZHrJ4wR6?=
 =?us-ascii?Q?05y93gPlJw71Om8VTuFR4CntJ/GGotNlFZ//HzXq4hRSDRaJJshgBodNb2bT?=
 =?us-ascii?Q?DSaTGdDLLelGkLZBqhcTrSeqMb8nodKbFCp0pgWeo5/bE1hBixgmx/AliOdc?=
 =?us-ascii?Q?VyCJ2e6m2hLJgUvIrmBNJ2icr0xei04v/7fKtuCy?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ljStpGBTk5JdGz2zbl0sp6ekQTPdsqMVFf59IrHAJSTXpkjxlRHSpx7dS0lpgUdo9PuYVHogAVPjmHStUTaFnsrSTD1NvcSc3HASlG6C5okqrMFP+aKHcH2JhGY8vPLld1awRl4mSd7i3PR/yb0PRbkL/dDPlsSdd9YvyReSPOy2USMZQqrsoXa67ca5L/poqtqnccQxuM31DVcAgSLaBsTcIl21A6gXFMqZvmryQ3D88YnUSv3iac+vVjSphTnlRZElQ/jbA1648U+mPCwDdGg8eKNizkqntzM5d9GfIa6FeD3kXfacTOm3MzEthXIQyP/Jtp3kiiF1h9Z2SZCGSl9rKmTDBH4O9+SUL1gKJhzARNfzzQ4PryH4k+sE5Nv1A/JKNQUuAEQgFbAOh5oSz21xL08Yc62m2UVFf71Ov+k2rNscG/32VfgdBnVV4NzJ87bRcdw+d+pwnQ5yFaMpp2TMd/2xF65YSUkXqU9Crcez+HLyObOHs/Lbx+gjo8yJHyTi3cKbxVwxcNHlfhnIL2r40Zquihe2y/zBYke0q5aaw+lLrfyKApFliK2LmnRgORziqJqGNYWQahd+lb5S+YqT4L5o5NuCuiEt7PJD590=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04afb6fb-0516-4e5a-96f5-08de00b32b87
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:24:26.4650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jdll4wdryYDwquQrsM4ZoQy6W1ntC6Bshj5fTdST8iGAAvjFci+HxkOQWd6QT8j2NrZBT7DxGJBhfLxftXQUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7078
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510010048
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NyBTYWx0ZWRfX+6cb7EhrRK/D
 iAyNjTTIbXCtehTfEjNViP9X8oBYFHQFF7Vdk0NiALIeUqZBzUTKOra/xRHOtVAHX2UVrOaqTWn
 X2i+7mFCweWis9a/RcvQT16SqJFCtYwxkV0j3Zn6W6RtYX2WPa18FcMUbha3CWjl42/ZehMRuGV
 BMFqAnt4ZH9BeqRuFigT8y+6VMTxFzhzR73IdrPmnWbQ+lRx+q9gGqgaKEmDY/W4y40TskbByv1
 CwLlb+u8H/Ggafo92N/CAz6LiorD6hB6LvopI3qjH3sPo0TKuMdgxYi0HUDGdHQMpIQVmfaHLVp
 BZJzHkQWx/iL7zUbtwVxQoIxYVE8qFa5YKRC3Wv7x+TgJLRuk91aMmz5dv3i59zsgWY6abnHwjU
 Gdq0h1UScrcLXWpF/xrWBWn2vpxE8g==
X-Authority-Analysis: v=2.4 cv=K/cv3iWI c=1 sm=1 tr=0 ts=68dcc91d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=7sizvdhjkexd0TlTBi8A:9
X-Proofpoint-GUID: VrOqnIUhlPBu9V5ud5RiCgc0AV9F60SK
X-Proofpoint-ORIG-GUID: VrOqnIUhlPBu9V5ud5RiCgc0AV9F60SK

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/triggers/ustack-tst-bigstack.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/test/triggers/ustack-tst-bigstack.c b/test/triggers/ustack-tst-bigstack.c
index e694a518c..267b07e74 100644
--- a/test/triggers/ustack-tst-bigstack.c
+++ b/test/triggers/ustack-tst-bigstack.c
@@ -10,6 +10,10 @@
 #include <unistd.h>
 #include <sys/ioctl.h>
 
+/*
+ * Create a ridiculously large stack - enough to push us over
+ * the default setting of 'kernel.perf_event_max_stack' (127).
+ */
 int limit = 4096;
 
 int grow1(int);
@@ -23,14 +27,6 @@ shouldGrow(int frame)
 int
 grow(int frame)
 {
-	/*
-	 * Create a ridiculously large stack - enough to push us over
-	 * the default setting of 'dtrace_ustackdepth_max' (2048).
-	 *
-	 * This loop used to repeatedly call getpid(), but on Linux the result
-	 * of that call gets cached, so that repeated calls actually do not
-	 * trigger a system call anymore.  We use ioctl() instead.
-	 */
 	if (shouldGrow(frame))
 		frame = grow1(frame++);
 
-- 
2.47.3

