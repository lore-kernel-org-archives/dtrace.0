Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C517A18E050
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936908; cv=fail; b=RtU412U13fPFpYqpXHpZ9pnLoKFXsz5XYoBpFBjmnPrQtrXIlXJGUQ09n2vcekScrBcbDR4ojnly6CjQWAW7ShOUyOLWhWkC16Ysn9+KU6u6G6YGMhMED1iC6F3Ijb1PIeA6Zo1RmBQuqpgFpTtIKeOPefeF61eIuamtO+/7RrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936908; c=relaxed/simple;
	bh=g6SjE1WwWv6pwWHXocxzI+vKLtT6EHrJqL5gtyJnqJg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=emza4NU3GR78JfF2kurZ8Canjq6/jqqzOspFPFrgCDcoJ4xlDZzD4UD6JUPTSLp7KTpAagyZBHUbhz89qZiKuXpTt3v6lmbRbPHRLanob1s7aQBpZ2ci6TWtKOsy5y6DSNSh1OV83M4W7Vc89i400Vr7D1oQtT1byQ+mIqmxgtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OblWIzJ+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CVEmH2lu; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OblWIzJ+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CVEmH2lu"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH0tGl014494
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=m6EdAN1T3dBH/gCEvs
	Y6z7LRO+8+U7CDmHs7E/hQSYg=; b=OblWIzJ+WFDNzy/sHv2S1SVRVHBZTILVpr
	QGRs0kYTpECv6ia/A5nNBEwZB/4rc8kYLmIenQdb5VjGaMejpeMFPZ/kEcIJn0DD
	eR2NLvL2Ms6WW5cguoS862EuUoTsnIDU0n57KL7W016Jy94COJBWekPwJ+vw4Ji+
	GoF04qJOmFqnAf60dzpUmqUqPpOci6wpPh15y3JkQEydX2bwg4vz40TqdyAtZyBy
	ugM3ChPdmktRWX7u0rXI2RYRT49/I1DcpkQQSl1epBGMyleuMEiZHgC5D0OH0lca
	3FsO939NtxE/rmvOsij7m1s09UgTP1vZJw82c+g1oasMhcJu9mvw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t78389xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGovpE011350
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:44 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11010054.outbound.protection.outlook.com [40.93.198.54])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rweprwm3-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRALyiE8DPLYTdr5AH8VqbTCnJnKZKMH8IQZOHySkGCfr+j/NfEXMOf+O3YvRSH5BpB7dYkuzZTunU9LHzOoP1NQRLLdnUVH0zT2hD4mrWXzOyEtx82BSY/xtfh/MVZQwaz4m1NSLGyMMA3F4LCLAhVAC0ACQr2zrRNoakNCY7vh44oyk5MqFBcSFBaoWDqCMNWyh+UDOG6eZtmEM3D2voVBhGoKkf52ZtrONik00VERYsuJ/0ox879n3r0Eh2qEkGA8f6/zoqUPHbxGVOjftAylbNoePvdE+y8xsWRSPZXX0N92svWQp6E6kk92XGgKasfdDHIh2KEdMFDsaUYMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6EdAN1T3dBH/gCEvsY6z7LRO+8+U7CDmHs7E/hQSYg=;
 b=T0I52+hyCLH+r8z+qRC/1+EKy1Y3pX7cF4zFo8WgJ+2TbeIwnNDqrY52rfJxMSelWNGIFAAs80GCEfih+3QTaasyfBuA0p9gkwA0lKnO9LJDMlpFvoupwTwcMlHvuW2h8JUaZT0N0JqCjg49nYmhDwrtOl9eHoKwGjFFGRdgR6TLJDT33rPB4PS4ue7ckSd/Rcj3KSHZxwXGqKbX6bLf0MJR/C4MqnAF4Adyo1v1rk9GXARpcR9GMxcLoyr86dnXvSLaBqP4lX2I6qoBF5U4yl4/az+qaWxVFPiT2lFRb8vJkdqXRcD9Y4VuKu6xNw2Zo6Oi3knV2av1xo1aeY2o9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6EdAN1T3dBH/gCEvsY6z7LRO+8+U7CDmHs7E/hQSYg=;
 b=CVEmH2lu9QLJn71IeHHCD23+WBPG4Dijlnn16CQKOsq5dYtdSk5WQTJ3zabvCQouWgEtI4qxAEBLHWSfHdYVp96TQqF8tjKq+W8l+URZJs8PbTkkdWWemgyB691bkcQYrrAQTovF2TGIBan60iMmFjzvFATXLk1kk4rf15bRW28=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7590.namprd10.prod.outlook.com (2603:10b6:303:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Thu, 22 May
 2025 18:01:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:01:39 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 06/14] Test: caller and stackdepth tests for rawtp provider
Date: Thu, 22 May 2025 14:01:10 -0400
Message-Id: <20250522180118.27343-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250522180118.27343-1-eugene.loh@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF0001641D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8aa26c-bf1f-493a-2c0b-08dd995ab32b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zvOlGJQicAtRnZBDPO+QkJVioeje8frgryMbP6OhYc48m5uSrTVVg8+4jxpJ?=
 =?us-ascii?Q?ghVSbr0tDkPe0xx31OzjEKK8lsImAf9RwWb5nt/jv30O8IxjidbKMlQHcBNE?=
 =?us-ascii?Q?oPQ+jlmc76CgXPofoMBV1UBJKXU3PashP80CK9RVOQdglOdUh/HfoN9cW+mZ?=
 =?us-ascii?Q?s/VnzyMHiNvvIrzSKowjYWOSOIHZ7LAnjUviLImRqdN4TL1nzMoSGrzmrqJE?=
 =?us-ascii?Q?jEs7zJFWMa5Qh81ToZurAyHFW5RLgOO9CyTC7NPevBm1uk1quKQlSuFyRcG/?=
 =?us-ascii?Q?rx3OQRyUNFrL8ercsQI+apoSEpSaaAUidFyuzyJDXdGM+hwNcIgHaoJvjPMG?=
 =?us-ascii?Q?LYUnuQMovBOlXCIdSl+eFR9tpBCaFeON4ZsO6gDfHZfVhjbREIK71rf985wH?=
 =?us-ascii?Q?2lvEdNBwQtgdzauzCcSD4x+v5kpbCwyr1wBKfO21f8+3kEAbRO4MDnXMdZZF?=
 =?us-ascii?Q?fIKI20XBd+lIvBlYcQs5HI7D2aE6QIrjBlleTbtuX+9Wp0sO4QPafvI4eeDV?=
 =?us-ascii?Q?NbEKdKnVOGLn5rsEyXiD2TacNnFzzFU/doBNEQyx+iHV6i8bc1HkqxxIGZ1X?=
 =?us-ascii?Q?panLQMu1WwTeFf4n+mHnwsWqaKWdOQUqWu6Tey2BJTAP01m0brFhRyav6S0d?=
 =?us-ascii?Q?jsY8rHvimbYGeA0yj1S7bPn6ILtq1Mof126SAMLzrgJbcnj8KslogDYJKGo2?=
 =?us-ascii?Q?wI2Y/1/H7fd/prXomFXZSuEsHoPQXsMuRnaqvb1HYbJxkpBQxThcrd3nJJS2?=
 =?us-ascii?Q?mIM0Ceq5CERA9/WoqN2lvIt9KdyLdEmzAZiEyOT8vFpV8T34R/wAxpRlOFty?=
 =?us-ascii?Q?iVoJRPTUR33pSyBUTKk6VF/Fxr5MZhNqsdotEllIyDspbMM/+BouSBs73q+w?=
 =?us-ascii?Q?RJSeu6u6YRR2EQazqPZcbGJiCBnpt4hR/sBeRQY1qNO5INR914+erI80rfdI?=
 =?us-ascii?Q?j+QGeq09dBXEWrH7MK43mlkJoQUguKT/7IBb8ydnsX57dgIMLhdLNFlDMwG7?=
 =?us-ascii?Q?d0pkVMls4SdEZY75R7xGitgC6JEHHFIigWeqkdr9BTENsm4ahRlIL+dTZCHd?=
 =?us-ascii?Q?Li9kKGcUiN0usjcfh4tWdhTPiZQ23KCpP2RRFgz3eiznO4Opz5EPG3+sh8Pz?=
 =?us-ascii?Q?ip7hWpargEp0Xvj1eF5ETHNV25oWaZFEZwGznrfXNUCwv7L4KZlx0VpUWe91?=
 =?us-ascii?Q?wo0d46rQ7u7PbEW3kS0edTbLnCxxwRIcxvYiv9ZWlmLW8TZUF/4lduawuKi9?=
 =?us-ascii?Q?z2X/L90/2If8Jwr77OJJp4LhBgvPhOo9hUQT57jpzAl7pAwFb91IzLVrdcM4?=
 =?us-ascii?Q?085pF78H52BP0Q9nSRmwd43kq1gDidUTGuruw0XkSh4UBwTROmnht+ABtEcd?=
 =?us-ascii?Q?nb+sut13GCyThQH0hHviMQYgsDBY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?61/6uyevgUsepSKpPF9PIllWJlXHSz65h4pFC4pM+0H8C/6PQjwtMfVXiMc7?=
 =?us-ascii?Q?170+D9+L6f7r2PqBojRc66Zzq/XDebOenxKBaRh2fvm6r1lLt3RdSLBT/R+W?=
 =?us-ascii?Q?9AVcf9cfqQVMUX6vJQgS1czP9nmf7a7KcnJSLJw0CSSJCq/HGuUPCZ/qGP2E?=
 =?us-ascii?Q?2TelUziD1n7D81jjM2EPbgZl08jLBcwUAftnk44KfeK09GUj6hdi2guFvP+F?=
 =?us-ascii?Q?5KJGA0vpQzqAwg7vq8M9P4sUaW4ZJg62A85EwHdiyfkgX5I1giYH0QUb/7+l?=
 =?us-ascii?Q?Jq/ykrHZNC6FL6JSKo2SABuTWI/V48mnyN8VLfMZSCZ8dnMHP98Hf5XkuSUt?=
 =?us-ascii?Q?kSFSRUxVrq1+pu/Nh5FzKpurErc/vLFtSX6RNhJPzMpB77dVvRvYmVaHfKzo?=
 =?us-ascii?Q?6sPo8HWF2BcLsTHfxL9dmTFhQVgiebNect0ueus/6CeBuDIFvAFDE5kQvSYu?=
 =?us-ascii?Q?ONjpI3inud6XuNLtvNKWLFJoX6fHgcOYQ9pN5pqpSZHJrX+BbN0fM4ifwupN?=
 =?us-ascii?Q?5biq+FYCL+8s+4upd2o18YutEMqJtq6JK5iwqi6SlHh9KVS9USjTH4QLxJso?=
 =?us-ascii?Q?/8tuZK9+z6nFs0GfsRziZCg2/RLa3w1LhIpVsmqI9YEoIklxgHDSijRZKK1o?=
 =?us-ascii?Q?OcPfBA0JebilEezdpUrhn5S1WCdKS5j7DEm1dwyMJhPKvuqRJCPeVbQJlFNc?=
 =?us-ascii?Q?txDz7xBXo1OSxYfWEJ9MH0EdB6GwkhmA8vZw49wKGmzTWTyP6kNmvQLECMHs?=
 =?us-ascii?Q?m7UbkeNuUNXtwUjDMSfYxBy0WiNjhKBopnhembQ4ufQ29S99cWfIYe1y97PV?=
 =?us-ascii?Q?YxwdSMZc5uYggWj2PCUYZUXqezvJaWqr/l69RDD17ozHkLPc3W8KA9gLCktp?=
 =?us-ascii?Q?v8efU1lXk6ru0IoNKlH1Gnz0AZRpDElnpfBIp3STeNN2ZYtG1X9XZQYCkrDP?=
 =?us-ascii?Q?DjVXyv0FgUllmZCnkMUlp8jF00H4tBdS8T0D28HLHsRC6Uj15PuJsPK3cAqS?=
 =?us-ascii?Q?hcH2K65gw1AfwMQ6/W5nRDuqaqKlNJmU4tCxIXFo6GWRnumcx8D0Q3LwkMzy?=
 =?us-ascii?Q?7eiWwqtMP0JZQ9EBFDSMyjGqKj3febV6LBF4kPwu8yRDh+mcH75MNxqSOQmb?=
 =?us-ascii?Q?NmTCxgfQX7/HB21uVSBZedP6NVwX33Xelm4re8R6o2U5AzJUp7kHbF+IfMd6?=
 =?us-ascii?Q?h9zZGa+ZivHeE/HM+MxkcmkLzAb0oEl18nxQ6WkKHEEPdnkD8NMXwElgqIE3?=
 =?us-ascii?Q?oBc6JokRbgAbmtdYjGzIw40XPNXvXfgzZMtfTXTl7r3Gxm8i3QpzBvdno624?=
 =?us-ascii?Q?8fi8hYCUr3TQgYjVt7T/3gQgM0KCGPUbCccZ/Tfyi+mAaJVTAWyyP+Hbgwwk?=
 =?us-ascii?Q?a2cW1y2HL4zXOb4ObUyW3BUYo0gtXXtoTw9cEIh8FPcOnwbNrAOqUwrpI7Ik?=
 =?us-ascii?Q?o+IPCrRpTXPd5dbnQAcgPNsebmOsgg7CGlAlqQoMQMjTiLovSeffb9zk9ZJZ?=
 =?us-ascii?Q?jgYSS+35aTKPQKeV6/0TcemC2IbejmJqWKG2apMepGdpCMBYXIhvbPgdjUTj?=
 =?us-ascii?Q?N1DCtNDWFd3OCK80CyithE0LO3bAjdM2Nza/oWMD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9Gzb5GjjC9X5lK2gBRdZRLUYup1YuziTkn/5x55vheV4Pnf2LHtwBq0IrrFmvqFXWk3VIS49tn8pvTXAoGzHf3yz4HeCsAikSMQrBxo4exnBAM33ZFuoyy9qb/TmJ0VrZEapp/oOVZhmCrjL1dM2lOdTdBXcDsacCZH+MAG/U8HhlDPf/EZSusp8Op/7tWTeNNeGLRXl6H8KTKjDaG2aD3TdQO19IgeFFHhv4/DIs98Eh9p4mxYM2M7c0/hQ2sD5SyAQfNg/DJVCnfnT0b8QppkeTcZoje4/t1G1xD2HLil/0pdt7ZrjTeQ28Rs7iQ4VWVE/O+N3msfR7nQdWs/uhIUHhwEpIG1az5zz+jhMpdQvCilwD6jW5mPy1a6bODEhJvvC4Qyu3D2YdYwt50jlBvGSg8FmxRySZfixOlgMhzZYk62wqTlD1QzhCZs0FPT1X+OXNrsOalKZGY4lcyMQuJApxw8Qy1udxSw2kUDNrDa8ebt5lKNbe2pqkBO5DOeA+Gcq6pCPdGS2CnGoiVsbh7ydMeyignABIQyaXODl+Va3ufgKfX/WNDpefSVgYO7zlJku6qrvQU+CbrW6J7WD1/3hszMED94Cf6ECChq3Vvk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8aa26c-bf1f-493a-2c0b-08dd995ab32b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:01:39.0821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYMgwEpxDDYMTXSL4gQckXbE/+UJb/BwstTpsTssinhPR4milr60TZCrspPMFQpXU7x+ALRNM4uVaqHnnyXswg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MSBTYWx0ZWRfX+VsvFtZWKFXx AHVd2IxgLGfgiN6CLSNxKVysw6xEwyKDm4TZLnTB3bprDTtWwMjZaYJPPuD+Irs+K5DkFeLKg95 wXNpAj2bE0lL6le7gwd9xs2YEoxmpg2OIbBfhdTjB8toSyGNOcE78vKshawhjYfvb2UY791nQhV
 IMqi+vKLGq1txR58kVw8EKva/aNKgV/m51ErYpoT6YQv8S2QABDD21LD5Hn2NwS7pyOfztUQKXN WH6t/MUORu3F0TG77ntWU1WgnOyIs3GazeuJ4e4vd3avVnrB76CddtN3JjOeULcI2slop+obIgr LHt2wj50kWmlkqeESn2jRen2iTG8I13OHrP2FFqMxaWLPyzTlew4Rbmal6zCK2vS/JRh0hCP4rt
 Hunjyr+BWiE1C4t6Wxh8O5DMr8tSHeNiUcu2Rfy3mxpJy4LpTsSTY8Gt1C2CYgMBu9BSIZA5
X-Proofpoint-ORIG-GUID: EgTuQ86ygQrvxx9_buZl60qe8oSiEkZj
X-Proofpoint-GUID: EgTuQ86ygQrvxx9_buZl60qe8oSiEkZj
X-Authority-Analysis: v=2.4 cv=H9Xbw/Yi c=1 sm=1 tr=0 ts=682f6689 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ghPTfNQJJ7Tc4bI1EqIA:9 cc=ntf awl=host:14714

From: Eugene Loh <eugene.loh@oracle.com>

Also, add skip_rawtp_old.x, to skip rawtp testing on older kernels
for the reasons described in the file.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/variables/bvar/skip_rawtp_old.x | 31 +++++++++++++++++++
 .../variables/bvar/tst.caller-rawtp.d         | 24 ++++++++++++++
 .../variables/bvar/tst.caller-rawtp.r         |  1 +
 .../variables/bvar/tst.caller-rawtp.r.p       |  1 +
 .../variables/bvar/tst.caller-rawtp.x         |  1 +
 .../variables/bvar/tst.stackdepth-rawtp.d     | 26 ++++++++++++++++
 .../variables/bvar/tst.stackdepth-rawtp.r     |  1 +
 .../variables/bvar/tst.stackdepth-rawtp.r.p   |  1 +
 .../variables/bvar/tst.stackdepth-rawtp.x     |  1 +
 9 files changed, 87 insertions(+)
 create mode 100755 test/unittest/variables/bvar/skip_rawtp_old.x
 create mode 100644 test/unittest/variables/bvar/tst.caller-rawtp.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-rawtp.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-rawtp.r.p
 create mode 120000 test/unittest/variables/bvar/tst.caller-rawtp.x
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-rawtp.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-rawtp.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-rawtp.r.p
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-rawtp.x

diff --git a/test/unittest/variables/bvar/skip_rawtp_old.x b/test/unittest/variables/bvar/skip_rawtp_old.x
new file mode 100755
index 000000000..bf7970832
--- /dev/null
+++ b/test/unittest/variables/bvar/skip_rawtp_old.x
@@ -0,0 +1,31 @@
+#!/bin/bash
+
+#
+# In older kernels (e.g., UEK6), the BPF helper function had a bug with
+# skipping stack frames.  While that many stack frames were correctly
+# skipped on the leaf end of the stack, that many frames were also
+# incorrectly skipped at the root end of the output buffer.
+#
+# Only two DTrace providers ask for a nonzero skip count.  One is the
+# fentry/fexit implementation of fbt, but it was not used on such older
+# kernels.
+#
+# The other is rawtp.  Therefore, rawtp stack(), caller, and stackdepth
+# results on such older kernels can be incorrect.
+#
+# A few other providers also have some or most probes implemented in
+# terms of rawtp probes.  They could have similar problems, depending
+# on which probes are used.
+#
+
+read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+
+if [ $MAJOR -gt 5 ]; then
+	exit 0
+fi
+if [ $MAJOR -eq 5 -a $MINOR -ge 10 ]; then
+	exit 0
+fi
+
+echo "rawtp caller, stack(), and stackdepth problematic in old kernels"
+exit 2
diff --git a/test/unittest/variables/bvar/tst.caller-rawtp.d b/test/unittest/variables/bvar/tst.caller-rawtp.d
new file mode 100644
index 000000000..9f8475071
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-rawtp.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+
+#pragma D option quiet
+
+rawtp:sched::
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-rawtp.r b/test/unittest/variables/bvar/tst.caller-rawtp.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-rawtp.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-rawtp.r.p b/test/unittest/variables/bvar/tst.caller-rawtp.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-rawtp.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.caller-rawtp.x b/test/unittest/variables/bvar/tst.caller-rawtp.x
new file mode 120000
index 000000000..37b3ef9f8
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-rawtp.x
@@ -0,0 +1 @@
+skip_rawtp_old.x
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-rawtp.d b/test/unittest/variables/bvar/tst.stackdepth-rawtp.d
new file mode 100644
index 000000000..ddcc0a13f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-rawtp.d
@@ -0,0 +1,26 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+
+#pragma D option quiet
+
+rawtp:sched::
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-rawtp.r b/test/unittest/variables/bvar/tst.stackdepth-rawtp.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-rawtp.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-rawtp.r.p b/test/unittest/variables/bvar/tst.stackdepth-rawtp.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-rawtp.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-rawtp.x b/test/unittest/variables/bvar/tst.stackdepth-rawtp.x
new file mode 120000
index 000000000..37b3ef9f8
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-rawtp.x
@@ -0,0 +1 @@
+skip_rawtp_old.x
\ No newline at end of file
-- 
2.43.5

