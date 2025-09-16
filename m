Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B82031FEFE
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 16:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758038580; cv=fail; b=BO5bmnca6AwwU7E+J8n+Ei1dA22Azz3h8eMJnlVk3OmBkfVoRBAPDJeziFatxPyQ9hcerwt+QxtjVDo0zHpP/4jUtJ+9+ZPZq3j7aEwbRma0X0oauOK8bygv+ctWSLI3hPTpU/8nE9SCEvfnavbnzxAVM8OANHzLdJ3zCuVCfIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758038580; c=relaxed/simple;
	bh=WI/iOIfRi8PzMota8ymzqBZJJnH1i7AoJ2cyErNNtP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CGycLcP20Rc85CSbZ4Z74g5svfCljCdH4d3UERXlIVABiqaa9WIcE6JfRBkeXUKqqyDPNIA+G+KteioW6bG2Dk1b1NjYwRSPQgg81beDhoCNHJbF/ayB+F8cy0Qny0mouWXJxxGzrFiDAbCyfhMcn5pep7bjHwO9gQLZzk65XB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Otbf/hIt; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yGdIPuUW reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Otbf/hIt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yGdIPuUW"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GD7s4v029960
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 16:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=YRUioZFPaJERXTy+aFWjYV12G5il/13i0IsLd2A9Z78=; b=
	Otbf/hItBEImPH4Kyp2H+0/d4q7BeNNDl+7qrzzgYn/gO3yKxzkZeaVxBo/78IDo
	Af8KtqspgTUEfG1prqL+Ams7+T522vc1EtcfH2P+cwc/tzdbSds9Xy4/dufTw9NV
	nq6fs5awxBpE9FPyVf+fpuRhYrxxspb+d0SDJho4WhRcZi27WLZR/phIfXMrlEDg
	M5AIGhljagV7auGtSU/+4KAa87zAUw6n4gtkIU4HvB2KeRDCQRWYEt/yDctDZB7p
	R/Htn2tiERU32nQ3AMAw6tVWkGXgaBp5mp1QrEFzsd1wBquXSnJRDOF/6gdJQSsd
	VMuVsKLczvMGzoFUIx0Dpw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494y72w22j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 16:02:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58GFQQ3j001595
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 16:02:55 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012020.outbound.protection.outlook.com [40.107.200.20])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2cu69k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 16:02:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/48No0lQn+F1LH6afM+0Ff2p5bW3JywXN1q9GUikiWFJqjslAjeQClIsp7uowjakLSlsCZQneCilihNa+kTtFGHTTG+VeTrUvO1PQngU3aieWeoRSMSqjG1St7DSV+zGg5rv29v5kuxDowsapGdf8KkEeHr8FSPQUYzahKMt4hRPNjoMoc02E3+n/fdvyhhNH2SIUetCOBtKNUYALSzNSuFd2Dk7P+yfFclDJ0fgdZudGo5wiJH9U7lvyDvuI5UwXJFKUbLL6kMY46G4FFddVJ4MjHthpjhN62I6aBVSrnqPRh8uNLj+BKaZRLx4uFVI+VXTbVdQVqU8A7G40ocCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSm6EPcbtBOysd9b3JE5pcBgIjOf1iQg5ZGyW4goGpI=;
 b=BbTnmwZJrKu3F7tfMmCJVJ3ap8MBOzmkn9b7lVa2Ya4K5d+JnHre1Ioj+SDUvSlXZFgww0ajHyfF64qDewAHuZvnHo8V2IhYE/vOcgKAC80wtzqOkywf0G/mLhBbVzSji0owo44uxkFZX453CMrnuo2PtXEqmWgoKOji0P7ZApt7nfDCqIsgzGTKvjgH2X/8NNjQSPdGlF5HjknvaJEPER0BZWeK9c5HdDQQFubylTcvG+Onw3A+HO9SI7ysdX0ubNodV9e81RTXlD22CUi09//jE3+BkkimGDUEheBZaMYCiy7GSyE4iMy2G7BqU0pjDFehusk708w+X8lXPUURXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSm6EPcbtBOysd9b3JE5pcBgIjOf1iQg5ZGyW4goGpI=;
 b=yGdIPuUWArkwRbgArDjvM3nJujXNCWWTFpCvQ50yLv518DJl/wlAZF+LVLJxnjtEkganNOcZ57Q7UhnTzypIt81Rpa2beo2jG6EkWChjPsmGLGdj1pyFboNytLZMYDfbqVLtIT9cJto4/3yJiqTiFPdTLkD6ZRQ0ChryBR4RU3w=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH8PR10MB6670.namprd10.prod.outlook.com (2603:10b6:510:220::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 16:02:46 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 16:02:45 +0000
Date: Tue, 16 Sep 2025 12:02:41 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v3] trace: print alloca pointers as actual
 pointer values
Message-ID: <aMmKIR8E5rdokSAr@oracle.com>
References: <SJ0PR10MB5672162D698C139186ACCDACC215A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <487cd783-80c1-e037-0c28-c2ff94364a9d@oracle.com>
 <aMjA7o55OLI9cATN@oracle.com>
 <aMjXfFOSefOzjlQc@oracle.com>
 <aMljZhoquVQGtvRB@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMljZhoquVQGtvRB@oracle.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH8PR10MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3e0091-815c-40bc-116b-08ddf53a79aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?hmV58Me7BwAhEz+N+dtKFGyZovegIBVCr+GUCBtQJ0ahgn7HpqRiIB0VUk?=
 =?iso-8859-1?Q?UWVifS2bss6BtuuPftU9/26zovKQVLol1EX+0nDnc/rGRYjEIIKYzs4jdk?=
 =?iso-8859-1?Q?Oqwi+EcNCeafqLwoJYVVaP5vOAjQHxu6954DXaUtFuCAnko4z7+dbDF5GA?=
 =?iso-8859-1?Q?ZtKZNO4oX9klRbA9VoYCDx3ULuz976gUk0TWEcxnTRQyIEBG3YAgcuSUXN?=
 =?iso-8859-1?Q?vMl2VJx6qaQyTuW0evUm7LAtX0yMalibCJl95qHBcJcMQBPDIDh8x7fROG?=
 =?iso-8859-1?Q?BrZy/V5y5w4oUow0DRLAQdBBDdRLoQC9NPVz0/B/pd86fwIojg/AnEvv9y?=
 =?iso-8859-1?Q?Etpb85hj37IZNGP8r3sgyjrVv7eLM0PlqODfkC0o3Qm8gFFgvOA/Li+FyW?=
 =?iso-8859-1?Q?GZD+MAgBsbI9EAm6DM68PizCWhKZgyCRm1psWcL2v1KAezVVSfMTeb+yQN?=
 =?iso-8859-1?Q?qSu6PmYgfc4RW6FuJN1APL+62RGH39SU+9QcbbKOmcsYBkk0YjCQsNHQ/J?=
 =?iso-8859-1?Q?Oh4QU70JzO5I33XEIiy6YJro4Lgcby/IaLIpf07bHs1gO6T32dpYQMs2T4?=
 =?iso-8859-1?Q?GAUUIcRs7tKkWdaBmMA1StPvURH3uFn5EArpDIviEKbvznPP33M2PkmPMh?=
 =?iso-8859-1?Q?wMecuDiW7KnIoGFE1a8GtYLjj04Q0W760+rOO5ULBU+ikCIqSUwT3BX5vT?=
 =?iso-8859-1?Q?vrMFW4dznpOxJwc4ejc/VGEDwmMDeuXzLchLsg1H8E5gF5j5aTop1Mwgr1?=
 =?iso-8859-1?Q?tUUME7fAAPUOenihR++tEVTLhRj86VyiATRf/BdmhR13jbp5rYoTwmmAqA?=
 =?iso-8859-1?Q?VOocgjXf3r0I28VTSiXD+kxYKrozgR+Xrs6KXtFQC5hBHggJSdMdG8hSy8?=
 =?iso-8859-1?Q?g2tcN6ljkhVr6+eayKPHSZmV3lUH/piRtiYkzdociV/4Gj3UC1cAFhR61G?=
 =?iso-8859-1?Q?B1Dk3WhjE8QgWEMIvIStYOypcRxDX/DR8UIYUSYFkvgFXpxC4sorjQhWiY?=
 =?iso-8859-1?Q?wxhVW9IfAeo5VDgiglExQH2THC6/FE62z06CE1+07nVv7OVkWlmMUAdwaR?=
 =?iso-8859-1?Q?R7QTsgqGE1nwrjRE4bGesoWBFDeHprn9Nkdlm5jKUJDizjKhGh1eA2HtUm?=
 =?iso-8859-1?Q?ir3J6MHkNy6kaqAma/uxPb1zteZJsB73T0foOLA+pfLVXBlk8zkQT4fACe?=
 =?iso-8859-1?Q?hThgihts6VhDnmZSXmDYvpV6EJ1h9CdfzFyH3iwv5ODE1Wx5cMGULsa+eM?=
 =?iso-8859-1?Q?hhEJhnFNu1SxHfBwfow8xm9ou5PQlDnnLNUusYcszISlP6TaPDe9T1wMVa?=
 =?iso-8859-1?Q?ZDFT0Ft9CDOaEMo4/wJUHMtvUnfMzfso0NTmhMZR3TsfycRFh9pBuzxgS6?=
 =?iso-8859-1?Q?frj2u92W8xoE3uGaV5JsnT930CLeVBAWl1ic6tnmWLKtUg9YaX0nRMoD93?=
 =?iso-8859-1?Q?r5mtm4pJLMOY95XDadZgiO09EFv94Xd8VwkK53lIOx9c0KHvuZFZt9sryA?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?JgfMXStn2f1E/KsmlzCdmA2SUOXCFZrNPouGQhe1zXzv1B861bUaLK9yOa?=
 =?iso-8859-1?Q?29OaYiM4FFte+052b7x9FBWcVPk6IhJaZDIpoSqLbD5wQ/SchhLTuIVfw5?=
 =?iso-8859-1?Q?hcT0B7ZbztqQ65mzvH4WtsMU4LQc/WRAmsiHXPz9chgRBwgQoIv3Qg3AHH?=
 =?iso-8859-1?Q?yNv6HGqKtw2So4nV3f598xI3+QyKZAEpiZNZ9YHagYgLIKpniMKCfIIG0p?=
 =?iso-8859-1?Q?Zjrf2Rnlfo7p7OhID2svJlxBBJ3QtI8AlT9CBrWD8uqG+tsEJV1Cq1MvAA?=
 =?iso-8859-1?Q?uJmi7IpSUjSFDrq9tq8c+sZ4Z9Dx84LWB95FdAb4OGten7+XtJwgQgqS9C?=
 =?iso-8859-1?Q?6HDet6JbwKjRAG1cimctngjgpQ/GmhKOrktdxQtCzdqiGr2NU/6VeBjL5t?=
 =?iso-8859-1?Q?o1YdXmXxLtTOAHCr5noLJS8KuF+exkSxflaqSlMPFwlEfUegW/IYth0fGp?=
 =?iso-8859-1?Q?o9sABa5doPtQi/MKcOHLKRgkqeYZ/yO28C+3xk02J9EApd2Ksihy1h1xxB?=
 =?iso-8859-1?Q?ev5NLJo82jX0poI5//L6FJSW3JnJ/9GN13r1P4T9yLBBQxpUXCwh0I9zco?=
 =?iso-8859-1?Q?qT9ZrJNKAF1Kn6EcWQvAIzjIxL1f/rDRvH/jdxAnEqEIZZNsbYb0rkp+Zt?=
 =?iso-8859-1?Q?hDpVXyGAw2cfXUsUbYxc3oTsOyYmAE+NgCush7+K4HZ4ifas8NO+gdmeg9?=
 =?iso-8859-1?Q?tnYApaS+X2Iwxifv7LmqGK+e4nS0QwWam6YUJHmWwo4O7YjCpN2j7H31VR?=
 =?iso-8859-1?Q?lgmzfYtLkC19L4trJa6XX8YlaQiWrsc2oFJ4x05fCA9jzQzWv2JL6vd/Aa?=
 =?iso-8859-1?Q?FL4tsyke2VwnqviKMyuVcQcam0/QHtOiYGtPLPUI8hYhvHXfPW2qQ+C12Q?=
 =?iso-8859-1?Q?EGYxDrlln2s/FiN7m9xrujSs3SYCNJCSJxr+jBVmU4d3nfrrGcwRLYV2KE?=
 =?iso-8859-1?Q?XOQQYtkEJ567pmtPnJA5J9Vu5wL8vd/KpcFz5sCp9L36CscGzozaLxVtov?=
 =?iso-8859-1?Q?svRInrgRBxb0c43K02L6Q0VFceF0TmJsufvSMnYqI00tTghYvNX6aA+hpX?=
 =?iso-8859-1?Q?G2xCt91xbY0ZS7+BuenF4ZI/UabXWK75DkwPb7LEfKArkTcW48Lo+VQKUN?=
 =?iso-8859-1?Q?10Y78WI2qXWvsCK35ABCR4beBUrEZ6/oEHK2jAMeFmgJ+mHJ5azy1tIQSF?=
 =?iso-8859-1?Q?4A9Xal5NYcNxQiqjfebwFT0W2TYHb07zI7jdwbOpH9aHccPknvH4IC2leD?=
 =?iso-8859-1?Q?zbnjTHtvE6d90F2cApzohV88MNnxEaDXTXn6KzY3Ei64FI2N93euJU2j+F?=
 =?iso-8859-1?Q?R5TmXn9emlOoZmxOWyDciIg70iKjGQMVvW5F9j5+toUggzR1yf2lRo9N77?=
 =?iso-8859-1?Q?u91U91IlCpHYTU3d0ehTPeizNSiopY2PGex4uwA0oP3FRGsqDkKaVhA+kK?=
 =?iso-8859-1?Q?//+A0u3Cn+KoFS0M4xuiYuNa6Qo/McI4ySTTGPdbo3KlltPi7zp0f6aevs?=
 =?iso-8859-1?Q?/4Xurqb9ax5iQ9kgwQJHH6gIgOkWckzyJoCMM0DpAuMJtW+16/bt9HNOWK?=
 =?iso-8859-1?Q?3u7b86VBaji+zD2HNzLgqs0heUDd3FM9kamEDMaIfn/l/XgIL0dF8OPHaY?=
 =?iso-8859-1?Q?z99bX9iOJJYk/JjfzNpmQq9YC3eVRZCsQ9AdmcpV75UcmF38B5I9xb6g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QdutN3AtUgJMbOODIthe+aih/IMZI3jb9YI/grCzg+53uAK1UbAr14ClvqnnZCwP9jn30ylM1hEnhhiipBV5fWV+NiS9WBXsCltAAnD5hc/xgt9GPAUNPp6RoiLwQPWEXWsI9m+U06EPKWRBUMxdeiIhqmZfUcrB5s4bkNL69AIXBHDyJM++6tu1SVsc1FFuxJZ/wwmkfEKXBa7YZ8Lp6tiZ3SNkaDYtrHT6MSGEqKrXVunIruKry6dJNVqEOBrG22vN0KWEksAKHg8RMHMmqwjAIxIC+FC+Qw4pd8GNjprl34DyfP4o6i1JT6qjF5NJ/HlVSJTsjYPZDiiFv7s/LGjlWTxdha3i6xZnkJSSVCnARhJUV/ub5J38dwXeatxmLfDc5m2XuCAdeQwgWurL+6iGUBZOVJEwgvXx9Ya28FLI+KvHX76qm1JoNh1UR6V0n1HbPTUiTDJYTRpPO9Oi0P6n6DrSXduak+O9F6pJ0Fy8/X4wjpLFSXHBEUrR2KucNYJmTriX141L5SCjKDwE+f8c6gXZM8gcT8WKXd3ZnSKjU3zadtbpxlUSDhez1jW57H8Kf/jrXlmEBp2bG5pLtADV2N0dS/8+FWQs7rh0eYc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3e0091-815c-40bc-116b-08ddf53a79aa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:02:45.7672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGDrmvsoyABjfZOnAffRtBd4c3ELDVZDGJ+GYND1O7C213CC8J5PHAAg9HlJzACXF6kKP/2lHMXS6itWBB84QISePU2V3+NYOCJvUs2WmWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6670
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509160148
X-Authority-Analysis: v=2.4 cv=F9lXdrhN c=1 sm=1 tr=0 ts=68c98a30 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=gFypfVqVzA86M2bV2SkA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: 8m2QxMmXJALS870KmChzjYaHfC3tWQVw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxMyBTYWx0ZWRfX4XLwsHoJwzOX
 x6gxXhahzPs5LTPsm1sA2Oqx8RxehUo/N55/5mLxt+5pStRfxlVLpQTRZMxM0bxubLc8DYjIJO/
 KUNQYPDJx7050uYQOHwT0XOFpcd1ueLyly7S33p+EOogl7EzL11EZNslAZPaNp/8Q6E+607AEmC
 rAO4GSlWIXYs1mrTwskRMa3voWnoQzIDCRHHmd0a+5ki32OAii3JJ0AwN1bzcR7pKSlmiqi2uSu
 K4IYi21XzismypzEmCKG32gfu2Fnr3E3bikaXyo01ePUyWihvw4w/HElyMjp/zBJnHjZxnrjwlK
 bXc3rq6f10XhAb6HffSES20jiiRX09gHDgdy4HGrxjGhiX/GjJjz1UXayXMsTG/IiSC5jEvvwgn
 i/oz9piJ
X-Proofpoint-GUID: 8m2QxMmXJALS870KmChzjYaHfC3tWQVw

On Tue, Sep 16, 2025 at 09:17:26AM -0400, Kris Van Hees wrote:
> Eugene: Can you test with my kvh/2.0-branch-dev branch from ca-tools4?  I
> cannot reproduce the failures you are seeing with this patch, so I wonder
> if it is a combination of patches that resolves these issues, and testing
> with just this one just doesn't give you the right picture.

Ah, I just took my tree, and merged dev-queue into it, and now I am seeing the
issue pop up with tst.tid_pid.sh at least so will look at that right now.

> On Mon, Sep 15, 2025 at 11:20:28PM -0400, Kris Van Hees wrote:
> > On Mon, Sep 15, 2025 at 09:44:14PM -0400, Kris Van Hees wrote:
> > > On Mon, Sep 15, 2025 at 04:41:43PM -0400, Eugene Loh wrote:
> > > > Largely similar comments to previous versions of this patch:
> > > > 
> > > > On 9/15/25 13:36, Kris Van Hees via DTrace-devel wrote:
> > > > > Because alloca pointers are stored internally as ofssets into the
> > > > 
> > > > The same as for v1 and v2:  s/ofssets/offsets/.
> > > 
> > > Ok, yes, sorry - been spending time on functionality over typos.
> > > 
> > > > > scratchmem area, they were printed as small integers.  They are
> > > > > now printed as actual pointer values into kernel space.
> > > > 
> > > > And, again, the patch performs poorly against testing.
> > > > 
> > > > The new test gives me:
> > > >     -OK 1 OK 333 OK 55555
> > > >     +OK 1059965305 OK 1059965637 OK 1060020859
> > > > which is to say that the dereferenced values are wrong.  (They are all the
> > > > correct values plus some offset.)
> > > > 
> > > > And with this patch, these pre-existing tests fail:
> > > >     test/unittest/builtinvar/tst.tid_pid.sh: FAIL: erroneous exitcode (1).
> > > >     test/unittest/funcs/alloca/tst.alloca-bcopy-top.d: FAIL: expected
> > > > results differ.
> > > >     test/unittest/funcs/bcopy/tst.bcopy_arg_order.d: FAIL: expected results
> > > > differ.
> > > >     test/unittest/funcs/copyinto/tst.copyinto_arg_order.d: FAIL: expected
> > > > results differ.
> > > 
> > > Hm, this is getting frustrating.  Tracking down why I was not seeing those
> > > failures on my end.
> > 
> > Where are you seeing these failures?  Do you have the pointer subtraction patch
> > applied before this one?
> > 
> > > > btw...
> > > > 
> > > > > diff --git a/test/unittest/actions/trace/tst.alloca.r.p b/test/unittest/actions/trace/tst.alloca.r.p
> > > > > new file mode 100755
> > > > > @@ -0,0 +1,11 @@
> > > > > +#!/usr/bin/gawk -f
> > > > > +
> > > > > +{
> > > > > +	$1 = $1 > 0x7fffffff ? "OK" : "BAD";
> > > > > +	$3 = $3 > 0x7fffffff ? "OK" : "BAD";
> > > > > +	$5 = $5 > 0x7fffffff ? "OK" : "BAD";
> > > > > +}
> > > > > +
> > > > > +{
> > > > > +	print;
> > > > > +}
> > > > 
> > > > Why are these split over two awk clauses?  Can't they co-exist in the same
> > > > clause?
> > > 
> > > Yes they can.  But they don't have to.
