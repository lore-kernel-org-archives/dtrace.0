Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFEA330667
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768517288; cv=fail; b=tVpmS9Q19x11InAkjhk864tIhzBab7gHSMPh5pdy+i+qMTd3pQjL0gbwIq7F1rVRThOzWXTAGA+h8ZNG7+CAc7W2K0Kon8v/odsUqX8yo3sx4oifiM0Z2ywCgi6MCTUCwbFhannQtdvl+GGffyTowyXr1LcqLl6ch7otL0jrSKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768517288; c=relaxed/simple;
	bh=ujdt2jYRQD/lVKfY877dyltu/GaHwcPpB/6P27R9pV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AQIHa0u7R6XtOLhsVC54N8fy8QVXoQ4gyOMyR1BVbIIQjhLy+Os8/dJaMzG1Xx6P1oFGIrhi+prX5+IV7pk74OF3hAOPnGOdJBxCa689IDP0vSlETVBo9xw/olN64NWUSrHOrX6XaZGIlfWAnk5wNzD2+d2fXRW9G75kQFnbcIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OTN7KuC4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IK9HifgY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OTN7KuC4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IK9HifgY"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FGXYFe2682611
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ijIagTwZEvDJ0Phy/X
	NZRkZAsAMh69jcLIbzTFZ5uJA=; b=OTN7KuC4LJ9yLQ4i/7L2tNORZ4A0M7KUWo
	Y1jDn3OtSGdmo0a4UjIfimMydSDf7bqpOrOv5DDwg4YTBmnyrSSS0fsHuqnyRd3R
	Gwd7zQ9ZYkGqt4MeNeS1jAKqqHVbioEObXq7n+kOfZJMmsJgU52Qu9fGcKoEVhVU
	U24iWcCIzA7G+q66bpA51AGM+YI5fdgWmf0iBZhYrGOcZQjtKHI1bm32uXs0R4Ry
	BER2IS2skW08uV9IYJhAA7TrDCR7uOO7S9JfiZKpTNZZ39OIKXlqAQVkAdKrAkAe
	5CkvI242CIvW48AGiJF1ltwwvLQo6TeKP8BKT5tP3YGl5zSyIrvQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkntb8ybr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:48:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FLdt9p009468
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:48:05 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011030.outbound.protection.outlook.com [52.101.52.30])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7nr7yh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:48:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLPT9K91RVUiPlBYLgvTLgD0JAU4fSVNJKEJOXlOAfIZ+7q6bQJa2B+2WTqQFoks7shVO+df581/09Dirnx1XCEH5q2d7XdjatLsQ3x3bx+viU3kTxi5/O7nOL165RyxP+5XaXQqtzYst2VmAIF1f2tvibVAZ2aMkIZWr+nqI3bDUcyj0QPs1uf1cmmtWqdBTY4F/Ij9jvd8+1+sLvzDnAbzQne5aFBif06T8is1kDLYzsk7kLgVPEXlWyHaDJn/aHLK72WBes7ECM+4Zb1IEWPfMJ/5cIvWZfZzAd1T0/9jZHJhy1kQn9teriq8vJ54fJKz6EwZaEYlRhUqwnjc+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijIagTwZEvDJ0Phy/XNZRkZAsAMh69jcLIbzTFZ5uJA=;
 b=VBkOJ4ljs91IqlsVUxOdhyXU66e1hQNx6W0Nj9Jxf27J4I8ASw6rNa7RzWkHJsEGC3eJCwZkXF5nvEXrR6feL0KC3GLXkBCf08WCYufrXRcPL5r3f6C65krwLoMNSLxUIuoTMgQuLtUa+Jiop6W2qmiqqaI6iTKF2eLi+vYtNJjP4WIOzxJZFBo1dRyivvPpuyo7Cxt+MqWJvJsWdblWDiIt/zTO+BdyUnsTV4PZYhZSM82nVsc+cZ9LDUb64yMFjc6tWT7VXz9tMnIW6/0YNlPW/GGYDLoswcFGAeF482j9MGBaB3AJKE/rIBazI/BnqRr12Zb+0zdhOy//alIjrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijIagTwZEvDJ0Phy/XNZRkZAsAMh69jcLIbzTFZ5uJA=;
 b=IK9HifgYFuIqvr5Ulp2vFcU67awFgQQHg5eKzOO99KkTvRVSpTQlNs9prfw+jtUu3jTmy9RdmjvbEGdGCjPj1crCRt9ghyBd6qMqx0VClpYGgv6ZiVTLl+VuRGjEqGDuS4S2mFlRr60s0HxwAADfrTBZDW+m5efiugHbnak7aVc=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH7PR10MB6131.namprd10.prod.outlook.com (2603:10b6:510:1f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 22:48:02 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 22:48:02 +0000
Date: Thu, 15 Jan 2026 17:48:00 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 1/9] dt_lex: support '/' in probe descriptors
Message-ID: <aWluoAHJlDsea04U@oracle.com>
References: <20260113165132.2454591-1-alan.maguire@oracle.com>
 <20260113165132.2454591-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113165132.2454591-2-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH7PR10MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 072b41fe-dd30-48f8-74e9-08de5488237d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HfLquQ8Ooy6iQyMpjLlEK5utaE3iRiJA58Nrx7Ws3mHL8XgpxaEtz0dcAJmY?=
 =?us-ascii?Q?MCf204bCVfxt3NYRS4ZkJDZN17/fTtHTVu4se1iczhyFcHDkh/u+h9uEIR3S?=
 =?us-ascii?Q?qvl89eRG0BVitrm/MVVtG2NsMvifLkk87H+CU9+DUKMs7Gj+EsHSh1Ham2px?=
 =?us-ascii?Q?wTidlMcn63NEuf/R1pWvZ04RnJETO0II7P5R5ZHGvNDGJTEtnu8OW93j2K3F?=
 =?us-ascii?Q?cj6dVbYCbThT8vHhkTd1irEndSep4g+Xn63a6F5LxTo2gF4GwDj8BsgIRZYz?=
 =?us-ascii?Q?3jxzA0MmanxvwR7/FhTn2NgMK8+MNW9QOU9joRJHLO3gMlayab3eium8MG6M?=
 =?us-ascii?Q?8BRVSnLcjBY1sSDmmX1RmIZmGQm/nhA7zCiqaYBbX+xJ8zUNTver77Wi4a6O?=
 =?us-ascii?Q?sngTU0s7WffdURfvRO5x3UV0ZkIlsqwWtoKJn2rO1OFMN4V/+AnUOWQdlhXL?=
 =?us-ascii?Q?thhs07xRtI17eAYeAfd5i5x6nn1YdtYpYbkUqXIjniusO1oke89AB0vPhJ/v?=
 =?us-ascii?Q?mdqjuvvOfw5LR1z2bHnaPfRPDttqz8Mwcot/wn0ELossLIVHzjgBPYgHtMW7?=
 =?us-ascii?Q?cn1BUBATc6k3NV/DeBgAaKIiyhvDSrxM4cGzqioQf7PIbouBSTorHrzJ9tsa?=
 =?us-ascii?Q?PjjD9QAsmIoixhmAxuMkWylXIS31/qMdaTR3aASofnoBUuh/xpsStGZ9Dq7p?=
 =?us-ascii?Q?rWi5XTezEHDG8Gbf7WwncVBOkYjla2fUQUfhnxvSsdqOkbNOKYgPUOyRDsDb?=
 =?us-ascii?Q?VPVFFCfsQKprm+yZaGsZdfgmTFlXgBVtGFhmcGOA0jNIYSM8FJoSP2pA/8GB?=
 =?us-ascii?Q?TzkeFBPO6ZBA5ya4KwybnC0DR85TaxyAwugMSQ6vBppqVcP4+euL20pwlZbY?=
 =?us-ascii?Q?og55Biey21MZhTJBJ1nfsFAESxe1xCCQqOYSYoZj+JN+GiEPInHiccD1c9WK?=
 =?us-ascii?Q?kUZ9gXlP9Y0hOeGYLbYwSz7tuANmgr6S0in2fJZLgYXhXgl64GCwH0VVcQoQ?=
 =?us-ascii?Q?Mycp7D+3Xox4Nv+EhJaJXCNBih7QMBM7+ILvVlBA7PIjZuVFm/GWTn1W94eT?=
 =?us-ascii?Q?oDUAlxfUOeR6lP+5sj1zHAOROH2cqnIQhnLzuA14ItqMjHVEM6gnofpSGL0h?=
 =?us-ascii?Q?wkx0N2vyuW4WKHscWcu0g4jG63YOsSDOrh3PTD/R9m+Vx9e+7zodT9kSJbXf?=
 =?us-ascii?Q?MQ/Iz9PbV/mLZBoGoPGEB6D/mnKQ8Dp9KLYL4tOSdaDkPl5GDL3UGZNNt4Gz?=
 =?us-ascii?Q?268tNKFW1CwI0FFetruO0WZIm4bjPPlOrK4zCvtKF+lRJDoFVz4ad9y7ChpB?=
 =?us-ascii?Q?CDhybZlIjpcGFZeUQyLw3EHAgznIOiOqwVtWaFni7hWhW5q4hRIZ3tx5SdD7?=
 =?us-ascii?Q?cf/Rw3Xov78aXo/mZzO/4LSndA/TO3BWNkwonb+RlqvpskLGDI7bapKgxCFJ?=
 =?us-ascii?Q?EMrMq34iJLe3YB8FW+Ag9C7/Mutzz+XkokJNhY1EAVwdZgrKHWoWagxJT3Zq?=
 =?us-ascii?Q?2wNp62ZSvB40EQJTAcmCJ2b91u8gYtodJEnKSuWAnbKfhIpOBPYopAg70neo?=
 =?us-ascii?Q?qHTgfwZ1+g9MjA5orYY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ppRLxTDP1Pvvf0FOD93zsMi+vqE1xZhFE3WQuM5adInzVpyVSA2zFnmGAf3g?=
 =?us-ascii?Q?eHp4AzSLRfp9YzxJqXrH2WnGk6Ii1+IuFZO0RRBXMGY99CK5FJgA9lPNUiGi?=
 =?us-ascii?Q?lQKPB8WZnMx6WkOWmDfdKimi3oaaD9j1qN+pwqwP5ZalqkTlB8cFgbXRXYxl?=
 =?us-ascii?Q?amXZ0ovCW/lB8c6dMAq+M3ODq63mSKVwW5QrDsOXuov8qmlqTdM5BqNCoRc7?=
 =?us-ascii?Q?Dlki7C8Of3Awmgf+dfCOf7h1lXU8xshveqMBtGT0OzqUhToF98mAM8csf+RL?=
 =?us-ascii?Q?aJlrevVjqwbFwEpYgCSYYj0X4wLC9UT7rtC/dn18Brp2nNFi09XmwFq16S1f?=
 =?us-ascii?Q?XMcgPbcUus3LEXAvell+lsxOElvYAAsbthvGsBwIMOnnW6j4URxcAvobhEoQ?=
 =?us-ascii?Q?ncKJkYo6vs9ASZjrtGpmTSv7K7jcg9hktXcdEELRRr924LnbsaeRSWmgJaBQ?=
 =?us-ascii?Q?4wXS+BsxPC5orYCYcf3mjg6n9njj3IAB17sG61k7GGFwwgdifXHCGPbcJE0h?=
 =?us-ascii?Q?xqFVrcTT5fGAWnDDEwKWkMDsf8wg6r9Kfwl0cK24Fr+CcoGcledP/Vg7S9UY?=
 =?us-ascii?Q?FcoTkFwnoSD9ydGoX8qKNUYStYiyGr0Z9V/eThBda6eAkDMi3qL1/5Yi8M5B?=
 =?us-ascii?Q?lKHWoAtIyCWmiVa4atdft94fJ2QTQ/c+Ikp7gQWggNJjitYvj01+OycyJxmE?=
 =?us-ascii?Q?ZQKeGvQNQRKHvRHsB1VMxJl99eRK/6owALghNW1H1okNdrJ8GwSea5BnRDvE?=
 =?us-ascii?Q?VYnouplQ63Ey6TADBOSMzH8rPJNxLXT+YAQWkTD37PYTw/d1m/zzIvcXeyMQ?=
 =?us-ascii?Q?xlEsWDUlPjpH5I6yWi+A1JB61FecaZIHerztBsWjYqonUkmCwqscxC37aZjS?=
 =?us-ascii?Q?Bmf8sDitkcXnwWvBAL/2wlBHzCPa9Jy0/EFKnkzYPbFTv0UQsodCL48jorGR?=
 =?us-ascii?Q?ELkxgBalsbAqCc3imgzBLADGQZ3Uh7/g1Xd0YpMdytxDXy4adsWDj15hl0Lu?=
 =?us-ascii?Q?9b7WpKlyDOQGSlN5r3Yn1U8NJ9udMsAhyO9VUMR6QITsy/urQuh9Q9qcKea/?=
 =?us-ascii?Q?ciDX53KdQstExxcAjsakT0BdB+LRj6Uuw7Vtx58kqizw45JVkSughmNuyPE2?=
 =?us-ascii?Q?6qQ0yKgJCFU1yj00ss3udsxAAt75Rz+KiLnmVoWUeLb+9DKRQXXD7ToqblhA?=
 =?us-ascii?Q?BpMioogBC9MwdzxD40JxKvNzVyJWEhhlnesWXdjbHVm2IJM7dejAsfohxOIc?=
 =?us-ascii?Q?wUbmdzwR0Bw99AKRlKAlLMqRlANO5zrmdCZM4l4xG/g7K3oU/XqVPNLnOz3U?=
 =?us-ascii?Q?IYtDv6ou4XUzgnM9eEdIkk807TtmkISaxRPtVWbxQfuAxK1bKQEcF/IkO6gI?=
 =?us-ascii?Q?nXkcDN8n6nKSg4XgWOUvDgUgIEAgkMMfELOQiZqthyhErsGS/Z+JPwxLGdrX?=
 =?us-ascii?Q?gBP7o/cdG2fIHA7+nGw/E/MJcGb1G2q9RsMJt7adHULgwoUD0WhxAEmFPk41?=
 =?us-ascii?Q?h3M/fDqU03T+aTwET9v6+bTMM2RW4H5ZW1W3yaZh4w1yhxDaB0/PQ3lgGa1q?=
 =?us-ascii?Q?CWAss0Y8Eykrw6ElfWRLfrjF0hWnZTouZrONH6Kqy0vzXK5tn29IyzSxFPM7?=
 =?us-ascii?Q?Z7zBDwO+AYXX8lgd3K78ywuf/TmtSGvwKfFAc4a/Uc9fO9tW1VhP+DJgO3yY?=
 =?us-ascii?Q?lK5UuqxDQCWcf2VI/rqeCnP+g4GU5wUqxvWnhWk2u3aNwf9iluuEnYpoZYbl?=
 =?us-ascii?Q?Cwt/MhQFrQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pvxIKx4hAau2CQSuqhbUjuhd5G3EwcPOst4aVFU+nbwzsMKXRUFCL5r8NlO06yDJ1HO7hLSAIvvDaoPvGnDCVGf1DH19DJG8hAQBjwX7j2pV3cP6zWq2NYCsD9au9uny11/I7xr0M+F3jNrUlhZFZZ2cttr3aO+bh2JZpLFRwB1F+fpYw91OW5eMuM2IHZVBK4vTwIQRBMYu9f7g2zj/8kadaFAtf8wMMOYNS/pmxcV/cfHpQtUgMEMDU6JBgs/18GwRzrQcDm06n5LXlYmRAQ2KBpjjRgl7RNQ0UM9eEHLupjQt4dWKu63wd1IBQrBczfLHR6290Y1ezRVIJeyfNTt6CXSc4WS6mc5+Fk65AsH2KRG7O85WMD5T7Py0uGmlD7FdvARLyAa2rY0SKgy4Wy/MW0z+b2q5YV/wWv2ViTl8kBQfBiIQvwH6EOSBse2qAGfxRL3Kx+h6bvwsPw2+v1VYia2wGD8Ttjji5kPFar2hd0wMyrEJVe8lO3Fp9Dv2WYSWlQZJ7mvBN9epNWdlLMiRkpMrNs9mG0bYMXm5YjHCqlJiNwfdXxjr7CTG/p506uSXFdU50fTpinF14itfUbVmCggldJkkp7ieQjzA3lc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072b41fe-dd30-48f8-74e9-08de5488237d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 22:48:02.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1o70lkPss+ayDeGq1RBS3QH86RQclZWYE7cpRfv7nSp+55R7on/UZ5JDT+IxGH3LaCiiHVbIg+Qqcc59LK/+MRCZyhIudmLX5ZfrZar860=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6131
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601150179
X-Proofpoint-GUID: qfb26NCgaFZTu4Q21FeXBK7fTZ_PIIdS
X-Proofpoint-ORIG-GUID: qfb26NCgaFZTu4Q21FeXBK7fTZ_PIIdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE4MCBTYWx0ZWRfX78/uM7nvUsCw
 JgGZrUa8BMY0T2RuT7pgJtrcjtJIO3Z2QI8Av4XraQ54CpYFa415sGt6MUtcS9Yk4V5j+361u9X
 VNqDtxWW157hqbc7fHbZwrvRE9d0ZQZodFh+Q89fh7kJU6fIAvF2uO6DPp+VsSDmBmxJwzFTLCE
 TScgcTxYf1qRvZmKkwY1x26dkiaJvu8RGzNPrCeGnQSLkpcUjGB9tj5N/r00y+z83p2YsN/k5Uu
 ihW1bcvnVPrqwPSLYZSoTfkRcjPIrWix2kWkpzARgvoPsJ71kGHEm38FPq/nlrBDwVbmVm6YMuQ
 ELSrPWx7/f42b+jttPhQab4zgZ8+H1wn771mhKYn89RQKJ6m3G63fm2uQd9ZWYfSi8P2gmz7tSP
 hRBYKMSoE3nhj68/yEwuKU9/7mcfkZ78gJDgZ2HYAHY9P0B9Yux/jDHcw8dflytUfCxiDI9aRRj
 gKEJcpGIupHKPCIZMA33o+F67wlBGnp3R+keUe80=
X-Authority-Analysis: v=2.4 cv=fIc0HJae c=1 sm=1 tr=0 ts=69696ea5 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=fyBfmTcnENtOxiFKEq8A:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12110

On Tue, Jan 13, 2026 at 04:51:24PM +0000, Alan Maguire wrote:
> This will allow us to support paths in module descriptions.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_lex.l | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
> index fd70aa0a..a8268c44 100644
> --- a/libdtrace/dt_lex.l
> +++ b/libdtrace/dt_lex.l
> @@ -48,7 +48,7 @@ static size_t dt_input(char *buf, size_t max_size);
>  %s S0 S1 S2 S3 S4 S5 SIDENT
>  
>  RGX_AGG		"@"[a-zA-Z_][0-9a-zA-Z_]*
> -RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`?*\\\[\]!]*
> +RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`/?*\\\[\]!]*

This change makes it that / is allowed anywhere in a probe specification,
except as first character.  That is a much wider change than what you propose
this patch to provide.

It also does not accomplish what you want, because if a probe specification
does not specify the provider name, a module name starting with / would be
reported as a syntax error.

Instead of introducing a change here, would it suffice to have the specified
library name be resolved by means of the /proc/$PID/maps file or something like
that, i.e. look at what the absolute path is of the library that matches the
provided module name?  That avoids needing to change the probe specification
syntax while also avoiding the complexity of not knowing what the library
search path is for the task being traced.

>  RGX_IDENT	([a-zA-Z_`][0-9a-zA-Z_`]*)|([0-9][0-9a-zA-Z_]*`[0-9a-zA-Z_`]*)
>  RGX_INT		([0-9]+|0[xX][0-9A-Fa-f]+)[uU]?[lL]?[lL]?
>  RGX_FP		([0-9]+("."?)[0-9]*|"."[0-9]+)((e|E)("+"|-)?[0-9]+)?[fFlL]?
> -- 
> 2.43.5
> 
