Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901271D14FB
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732044612; cv=fail; b=f5oCVqIuKioR13xV3HleGnmmyewQEQmmkEQJ21UfbaLSmrfmorRargqoRBzlfjh9NqhzDUxPDjTa0RrpoO/u+d+rASmMUjzw96UxVYnNXPI6JGQt3irku1ARAqhXpj+VWw3wMgxnXXvlj030s6pgIrF+BS/dm1AFi7Ht/fZSWhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732044612; c=relaxed/simple;
	bh=JDVP6vxF8bivvRLmrfOFdYn5XGoDtwQy9RC293iYvrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X5KL9mixpSvWgr7LzkKhQJ6U6awqtxDRptZSgoHjpN8BGmXeAIm9toyf8W3G/L2asn/dYmuOVrAttgQCTcqlGzFvkGuXoapsf59kPcj7y+CgIH06kwtT3gqg0qYugdK1+x7SYP6S+nBlqv4+WL2XfofnfW4V9LGDatCANlxzXV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gw4ANOl4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=j/kNlddd; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gw4ANOl4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j/kNlddd"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJIMYL6010420
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=66QPMzyHbNcoXcIARy
	GbULwtTzKcVMIBavPHChC3/z0=; b=gw4ANOl4CPcJgSSbO7OstpA+MKyvhKpndK
	YYAFg7Ru1VX3NJk/QUMg2ad4nAVIbxn3gliHd21sHnZPmHfK42pqWE/dcFtYdLRf
	IdMcHx+ZXMfwBOgZziXTs3Aa2DUzQBqDim+In/uUeyYquKebzmJ7CxkgFVEMGQ2v
	EN9ZEnHHDK0JFJtRNptKEtIkZ1duZUsGqdZUdvSqE3XWKZYVnXPma0oY8hCHiZRb
	elg7JR7ipHW5WKorYzkQapgoJssLlhJllATgNu4P4CyVzfOltaGzhiQyBKcpCkvx
	XW7mAaJeNI00+cEA7itIviWksEkyO+m1LfjubzXg17jSsCWYTzqA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42xk0snthw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:30:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJIwQAl009668
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:30:08 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42xhu97f0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:30:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkP2Pg5ELjrPK0dDEoMds4+65AC1jAiDN4m0YcPE2gxGzjYBPQzi4P2B54MpyUuEwYpbJcOcQMt2tkCP/Anec1n+5ly/CiU3KItvI69SpJAEBD50MLemeBJjpQWEOSDTQwwN+N9tsOdFBlD9OaoUfHln/HlVqtJ75ISDt6CKvP4fFi3tEvtDHtkvMyIHMIMAI7BGxceVT7A/cwPryJ9ZeKxYdQV+T2XqcTlyJZUTCuHsSEoacf7GNIZId90efVfQI0QW3h8K1YtF0pMzrzyd/tT5KruTyOgS/ej589sVVOOUgfTISkFL+M+6NPIpSmZBppB2RriClasGy+HhqOgq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66QPMzyHbNcoXcIARyGbULwtTzKcVMIBavPHChC3/z0=;
 b=euyRKwkuXgJQpa5GN6vbCCbo9w4f/rYgnYbMRG7bf4+K5/WgP/qHXHPxtn+S2np9B8v86tEWj/7xwXoIwuDXcNvVo94qz1k90vsvca220fAMFvON6i478oLWMHQiapgvL/awNcgsWJAKgeRjJYjiVr7oZK38/FF4JbFxR8AoVglqmrtZuo74kCYZYhKbQgp8szG9+NZshsy1N94X8pzjB9zU4qn8iUJUn8iWfAsgIFOKKeNDqqaKBvy84mClwgO1A6txo58r72lvGBIzqnO06XY66RVUH2Ht5cjz+8b1wjKkA1iQ+no0rpLnQ+d7/J1uryrDv7Bg8XqIdQ4HPC8Ymw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66QPMzyHbNcoXcIARyGbULwtTzKcVMIBavPHChC3/z0=;
 b=j/kNldddMpCTRH+jn/P4z4FcBYpBIbLKnVxC50Zo6al4KFIl6WtNiczQcGWcRbFiGcHM1Gl12TsSvLu6UBhqIHhLk7tIXpMEsKbk2ZMoOeDHORLouvHWPNRFRtZnt8UAOQ//knmbunTOJBwLvlj4a/Vm3wyBCAU8qOaXeOJmqeE=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by IA0PR10MB7208.namprd10.prod.outlook.com (2603:10b6:208:404::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 19:30:03 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 19:30:03 +0000
Date: Tue, 19 Nov 2024 14:30:00 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Change open() to openat() in specopen
Message-ID: <ZzznOMekRZ6CDNGV@oracle.com>
References: <20241119191815.17767-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119191815.17767-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1PR13CA0428.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::13) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|IA0PR10MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f933b3-8b67-4a8c-b96a-08dd08d0910e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jkk5p+RI4RWaK76h1a4wWvahC5ClQDKXZxpv3QAu2J2ZQm5VD+TL8HEezjE0?=
 =?us-ascii?Q?36X5lPIRBsQbFDtaTnYGI4ShGnH/oYXp+W/8D6mIdznoUmU9JBszg+EwYHBx?=
 =?us-ascii?Q?T16bKT0ztUVfUWpoFMwbEJuRvRIQpNSXuOVUnPXOYSmX+VHnEYabAlA+rEiL?=
 =?us-ascii?Q?lWeLkEA4kRUj+cSiJq8ObqhqD3EZm6TdlcqvI+MKa81Uq996/OZSObFEzGnd?=
 =?us-ascii?Q?7B5S7oPwLoVeCu6vSRyUckNdVrt9QVtZOaYOyKott4C6Dgas9J1f2nFdRYHd?=
 =?us-ascii?Q?gNOaMgaSFFS3S6GBdckkScU71IQ4B6tTWTS2k/izWw5PlHbjCUNG/obVUlgT?=
 =?us-ascii?Q?C+1Y/oVDSpDp8TCiHz2qTKxxPAk8VFYT97agetPbvwQasvpZJCKSMU/zzMdt?=
 =?us-ascii?Q?ynQyv1ucYnMED7O8SdAUVkRUmg+EE41l23jRBTLL9Eu4SFXWNu8pS77/ZBc/?=
 =?us-ascii?Q?TU/c00/JJ75VvzpqZYE1qYbXzw1aq8i3AXFrNVwZMSWMFqAA1bTZZxoQuw8G?=
 =?us-ascii?Q?rXu3Tj3ZhA+CRcM7jwL4PBDpn6p2BCHMdgf5Z367e1VpSwvWkmQsX6KUrU+J?=
 =?us-ascii?Q?0rf5VQF4G6T+usMOgqgqbE50P8V4b11eFNAgCq9cAMWGO2aiGfCZYLtDzE/a?=
 =?us-ascii?Q?JN9IyC9R8IzVMdNc78j75+HG6bDbPg1vEuFkN5zN/tt8NQZZWXAeGLxGOZOX?=
 =?us-ascii?Q?XXL2G/qaFVIEcQhMIGw042wI4JcuV3L8AL1VragxtKLMOgl8OpAzWDGZk4S+?=
 =?us-ascii?Q?uSZCqFyigVAgdUY63I0+0W8aSnSD4bLoQa+JsO62ynldqtGA4VimlAgUQ4WB?=
 =?us-ascii?Q?Y6DGi8822MTPtDA9I4WpXCCZQS/ry8Bx1O5a/wdGxlXAbUnIqDqHWAqa7x8F?=
 =?us-ascii?Q?ISEH9ljNuLbJH8C7yYBRJ64VhnNApUuC24QGW732zeE9n05/7wpIZ2o0//vW?=
 =?us-ascii?Q?jM08FvzyVSXC95ye68P5srsYoBuZa/48NCER335GRHFqRqzoaQ5+gz/o7/Ls?=
 =?us-ascii?Q?gSWAueiZDS5m8oHE1isDbYgstKCQ5hjNwzDi7hkzRbkkgqV9Fxw9/jec0Nyp?=
 =?us-ascii?Q?VgUSn9pjWvsapVai7BgkHbgUHQ/WCwoYmKgkdyxqftNCY4agcNJjCaySS39p?=
 =?us-ascii?Q?BDGyqvMIhhoYWwzNcRg8lxxstRa38i34/4WwHwWw+wmuwrR3VtnCyeYuyCgg?=
 =?us-ascii?Q?QiJzKIDk+DJeVVMpmDMWb7HU0W1+g4UvcxQqG8hSUP/jWNadPMnZhEPPimjJ?=
 =?us-ascii?Q?vRjftkgWwitn6kJHFKig41B7BhDdPyrZkP/oS1Hpi3U7K95Aeee6FNulcdu9?=
 =?us-ascii?Q?9EI1bRwFR0T6bPDP1YQxr0N3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jC5Xxh951jBCg002N95tE8BpQuKbIWxSY/VUSOwvcndfZZEY+lPhxyZE61lP?=
 =?us-ascii?Q?M4oNOZS8bANJxSw1G1ys6t/m+tVeLvfvJ2YP/W6DzJOTGp597bAUn9vUVUT0?=
 =?us-ascii?Q?KIZab2GIF5uejWev2/p3hBXfM5OEvwN+hsmZUHcIixypOYAfKrJV+EKPYTKQ?=
 =?us-ascii?Q?2qUl2acRHQQmXHiH0F0MgYajQPu3vFN+NMqwU2g4H/Kl0BUIgIeVceoVW35p?=
 =?us-ascii?Q?lRKSXFkYI60kMSy2ZUq1fotYdVTsJ/jp9R7OQ9hgTA/qDfWgXFEl+boxxJNE?=
 =?us-ascii?Q?L+ikkAqrBgAs14cjwAM09FnHn5Xv8EQ8XB1HuJbK7rx+DVs6a5dqj3a0ATYQ?=
 =?us-ascii?Q?Co2sP98hbCbG5N3QOJoAozAZ9e1dTUzSH2FnIFewC6NVQmwmbHESP64nmjxs?=
 =?us-ascii?Q?uNTKKapg74HfbVky3pGx68XIzzuo5iQ1NcKPjyMlz/vtqm8ZfpUOKyEHePmF?=
 =?us-ascii?Q?nJqK9PSA+GR5+61GtIE6s4uf0fXu/No3W+sLTsnhs9F0NLTzOS86IMKBWfD3?=
 =?us-ascii?Q?YkjoZyPJ0vM9yiN9GW6YzgkM2VeiuJbvlS5ayEzPf5yqGAhzjSXHlyJ5CbVl?=
 =?us-ascii?Q?VFe6CMSAFfkGLcxe54t1pub6BfYneHe7lB4Y+/V1iiRg+jhzQx+QiJDD+C4f?=
 =?us-ascii?Q?bbatliUdoiVk4wef6AIDSglKWpzx2dJwy5/DiQHf7E4sfQEjH+mifAta6a9E?=
 =?us-ascii?Q?eGedbSHZ+PuUdZea/wnj47FweK4Vk/8O5D1ukp1j+tsbeT1JI3rgbkqbykqq?=
 =?us-ascii?Q?SDXYrSjeCBioIHOpgX3g8l7P7k39/e8sVuXtfgupPiK2jm/WDrnmg2LXh8qN?=
 =?us-ascii?Q?jOuD3hzrUQd7J4CGcxpfJbd0KMv9WpF87GjsiYa52g+6iREcptSbnr4a4TMM?=
 =?us-ascii?Q?GJZ7hIoRnnObL5RErBhHqk0zE7owII8s8eBkhnlyM4MM8EKPCfAfBVsynle5?=
 =?us-ascii?Q?PpIL0T2ezOwxptG5YL4U3roYP1oklFxKpsmbZg376ipfsZRLaBqiNpYRdfSN?=
 =?us-ascii?Q?TT+4fnQXQhgcKOR9b7PExd9IouLdOcJqPp1wdKH3Se2P65KRXnEM0c6zaNLX?=
 =?us-ascii?Q?4JImknyL94ellUcChsO8h6lzFmjdZWTn2oJ9t9HjADV+E6ye/f0Zde2GMZT/?=
 =?us-ascii?Q?5RytJonq3QbOywvBFbySkArOXzenKKgdMN1IQicGHpo4/sBO4ptS4HL1Vnrj?=
 =?us-ascii?Q?VVPWunYnpgUThevjW8/u1kacM07EE6p5e/VUw3phV17nN9CCUAV21hSG4+Ip?=
 =?us-ascii?Q?FGNfylR7EbRvgMvsUgpYT2GEUxNtae022oqw7m1lrm/yagV8vQ9++xxharhN?=
 =?us-ascii?Q?0+QGjfAqrAFZbWCAM5I+IokSyIFpEXROzOobvsVJByskFoOdm+Yw1ycp/iaH?=
 =?us-ascii?Q?dkl0liHbUBl9yuVFoFC6oTAce3SjT3v8QNutL80lSToseRzBh7ql9va9JhBj?=
 =?us-ascii?Q?YRmAASifLWso4UUtF019zXjascY66ohBJ54ewSGcR8Hc6wY/p/TFhwavXVm4?=
 =?us-ascii?Q?AWOj+bbkcqMNT0b5NnT9PIQgCO83LKQroETP8ixs4Hj6Vl5Nt1rVIBeZ/kKf?=
 =?us-ascii?Q?azWAXS43Ib0kCX6xyj2+/x2fi8xcizKHriIcfWyjbbQZN8Sh9SHqF6gCe/vt?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vr0Gdb4UMb07IphACAT2G9wkftusZmrrYEqn5D9VXhXMr5yGwuwIFOrsocmGkmmVnXBqXgmaGbl1ceCd9tHmYzlQBEoDt0l64ANza2g3kgc5S2zJvNoo5k8zPhMOSVpZ6o/WSZBTvmgQkqChB953u0ULajwOUsRU0tflXaW1WhenNveVeiWcujZRcdnXZp9FiG7eRQNrftEhf9EImaz3TQIwPB4qVvGuMmUzhbdSIb1aWuehd4FyZjCXK7fjPvNmQ5XLS3R37SxL471/6pcDoeHZylSTWePZdQelw6pjc7+t2HJ5ciKmMgyZhSQf23M11xPM0SFvJ2/DXjr4HquOLd1JEElX4KRkWSTpJEjMgq95VdEuPjY4TiHEzKfAYzE/YGhUt4eFQzpXuO6/z0Ufl2PaRSb8UuJzf/qpMFN6xxSEVbCcsmz3EECWHUFDPCiawCuIlSVw6MNGTaWyOiJAajqJIlv2uZ6aCItTzSFwGXtT1O7al9/QoR/kjBXRLv4SajZcUPvymHQqMHWEoqFuNfgQs2JNRUYrzTL9IfGOTajsHuiVQ7SZcFYv8S5ru25dxldDzTDJIub2d+9p3Sw1mafyG2eN8YETiwU/IPyrC24=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f933b3-8b67-4a8c-b96a-08dd08d0910e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 19:30:03.8570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kVW6cd56CbvkZiRT8Jwoa0sag0BOTXicRD0aZdXmUxgB47Nv/XzjvQCfuTRDqNd4Z8JydSP9K5umk+7LCcV9Pe+F/FpHKROCB27LPve4mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7208
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-19_11,2024-11-18_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411190145
X-Proofpoint-ORIG-GUID: pMxYrEThUGlZ04iaKMbTDIk8pt0OME4n
X-Proofpoint-GUID: pMxYrEThUGlZ04iaKMbTDIk8pt0OME4n

On Tue, Nov 19, 2024 at 02:18:15PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit 751f8f46dd29 "test: Clean up tst.specopen.d", there was
> minor cleanup to make this example run.  Actually, it should have
> converted to openat() calls, since open() is deprecated.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oraacle.com>

> ---
>  test/demo/spec/specopen.d | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
> index 700bdd9ff..e7dbc3b25 100644
> --- a/test/demo/spec/specopen.d
> +++ b/test/demo/spec/specopen.d
> @@ -7,7 +7,7 @@
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> -syscall::open:entry
> +syscall::openat:entry
>  {
>  	/*
>  	 * The call to speculation() creates a new speculation.  If this fails,
> @@ -23,7 +23,7 @@ syscall::open:entry
>  	 * speculatively traced; it will only appear in the data buffer if the
>  	 * speculation is subsequently commited.
>  	 */
> -	printf("%s", stringof(copyinstr(arg0)));
> +	printf("%s", stringof(copyinstr(arg1)));
>  }
>  
>  fbt:::
> @@ -35,20 +35,20 @@ fbt:::
>  	speculate(self->spec);
>  }
>  
> -syscall::open:return
> +syscall::openat:return
>  /self->spec/
>  {
>  	/*
>  	 * To balance the output with the -F option, we want to be sure that
>  	 * every entry has a matching return.  Because we speculated the
> -	 * open entry above, we want to also speculate the open return.
> +	 * openat entry above, we want to also speculate the openat return.
>  	 * This is also a convenient time to trace the errno value.
>  	 */
>  	speculate(self->spec);
>  	trace(errno);
>  }
>  
> -syscall::open:return
> +syscall::openat:return
>  /self->spec && errno != 0/
>  {
>  	/*
> @@ -58,7 +58,7 @@ syscall::open:return
>  	self->spec = 0;
>  }
>  
> -syscall::open:return
> +syscall::openat:return
>  /self->spec && errno == 0/
>  {
>  	/*
> -- 
> 2.43.5
> 
